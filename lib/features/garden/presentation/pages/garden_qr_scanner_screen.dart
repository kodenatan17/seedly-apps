import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../../applications/entities/seed/seed_entities.dart';
import '../bloc/seed_resolve/seed_resolve_bloc.dart';
import '../bloc/seed_resolve/seed_resolve_event.dart';
import '../bloc/seed_resolve/seed_resolve_state.dart';
import '../widgets/qr_scanner_frame.dart';

/// QR scanner for a GROWPICO seed/kit code — route entry point, exported by
/// `public_api.dart`.
///
/// A detected payload is resolved through the same [SeedResolveBloc] as
/// `garden_code_screen.dart` (`POST /v1/garden/seeds/resolve`); on success
/// [onCodeResolved] fires so the route can push the container-selection
/// step, mirroring the manual-entry screen's flow.
class GardenQrScannerScreen extends StatefulWidget {
  const GardenQrScannerScreen({
    super.key,
    this.onBack,
    this.onClose,
    required this.onCodeResolved,
    required this.onEnterCodeManually,
  });

  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final ValueChanged<SeedResolveEntity> onCodeResolved;
  final VoidCallback onEnterCodeManually;

  @override
  State<GardenQrScannerScreen> createState() => _GardenQrScannerScreenState();
}

class _GardenQrScannerScreenState extends State<GardenQrScannerScreen> {
  final _controller = MobileScannerController();
  bool _pendingResolve = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDetectedCode(String? code) {
    if (_pendingResolve || code == null || code.isEmpty) return;
    _pendingResolve = true;
    context.read<SeedResolveBloc>().add(SeedCodeResolveRequested(code));
  }

  Future<void> _pickFromGallery() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    final capture = await _controller.analyzeImage(file.path);
    final barcodes = capture?.barcodes ?? const [];
    if (barcodes.isNotEmpty) {
      _handleDetectedCode(barcodes.first.rawValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<SeedResolveBloc, SeedResolveState>(
        listener: (context, state) {
          switch (state) {
            case SeedResolveSuccess(:final resolved):
              widget.onCodeResolved(resolved);
            case SeedResolveError(:final message):
              _pendingResolve = false;
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(message)));
            case SeedResolveInitial():
            case SeedResolveLoading():
              break;
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            MobileScanner(
              controller: _controller,
              onDetect: (capture) {
                final barcodes = capture.barcodes;
                if (barcodes.isNotEmpty) {
                  _handleDetectedCode(barcodes.first.rawValue);
                }
              },
              errorBuilder: (context, error) => _CameraUnavailable(
                message: l10n.cameraPermissionDenied,
                onEnterCodeManually: widget.onEnterCodeManually,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      _RoundIconButton(
                        icon: Icons.arrow_back,
                        onPressed: widget.onBack,
                      ),
                      Expanded(
                        child: Center(
                          child: BaseBadge(
                            label: l10n.scanQrCodeTitle,
                            backgroundColor: Colors.black54,
                            foregroundColor: AppColors.white,
                            textStyle: AppTypography.labelS,
                          ),
                        ),
                      ),
                      _RoundIconButton(
                        icon: Icons.close,
                        onPressed: widget.onClose,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        BaseText(
                          l10n.scanSeedCodeHeadline,
                          style: AppTypography.headingM,
                          color: AppColors.white,
                          textAlign: TextAlign.center,
                        ),
                        const BaseGap.v(8),
                        BaseText(
                          l10n.scanSeedCodeDescription,
                          style: AppTypography.bodyM,
                          color: AppColors.white,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const BaseGap.v(28),
                  const QrScannerFrame(),
                  const BaseGap.v(20),
                  BlocBuilder<SeedResolveBloc, SeedResolveState>(
                    builder: (context, state) {
                      if (state is SeedResolveLoading) {
                        return const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.white,
                          ),
                        );
                      }
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.qr_code_scanner,
                            size: 16,
                            color: AppColors.white,
                          ),
                          const BaseGap.h(6),
                          BaseText(
                            l10n.tapToScanHint,
                            style: AppTypography.caption,
                            color: AppColors.white,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _RoundIconButton(
                            icon: Icons.image_outlined,
                            onPressed: _pickFromGallery,
                          ),
                          const BaseGap.h(28),
                          _RoundIconButton(
                            icon: Icons.camera_alt,
                            size: 64,
                            iconSize: 28,
                            backgroundColor: AppColors.white,
                            iconColor: AppColors.textPrimary,
                            onPressed: () => _controller.start(),
                          ),
                          const BaseGap.h(28),
                          ValueListenableBuilder<MobileScannerState>(
                            valueListenable: _controller,
                            builder: (context, state, _) {
                              final on = state.torchState == TorchState.on;
                              return _RoundIconButton(
                                icon: on ? Icons.flash_on : Icons.flash_off,
                                onPressed: _controller.toggleTorch,
                              );
                            },
                          ),
                        ],
                      ),
                      const BaseGap.v(16),
                      TextButton(
                        onPressed: widget.onEnterCodeManually,
                        child: BaseText(
                          l10n.enterCodeManuallyButton,
                          style: AppTypography.labelM,
                          color: AppColors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.onPressed,
    this.size = 40,
    this.iconSize = 20,
    this.backgroundColor = Colors.black45,
    this.iconColor = AppColors.white,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: BaseIcon(
        icon,
        size: iconSize,
        color: iconColor,
        backgroundColor: backgroundColor,
        backgroundSize: size,
      ),
    );
  }
}

class _CameraUnavailable extends StatelessWidget {
  const _CameraUnavailable({
    required this.message,
    required this.onEnterCodeManually,
  });

  final String message;
  final VoidCallback onEnterCodeManually;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.no_photography_outlined,
                color: AppColors.white,
                size: 40,
              ),
              const BaseGap.v(16),
              BaseText(
                message,
                style: AppTypography.bodyM,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(20),
              BaseButton(
                label: context.l10n.enterCodeManuallyButton,
                onPressed: onEnterCodeManually,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
