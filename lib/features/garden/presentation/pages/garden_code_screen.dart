import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../../applications/entities/seed/seed_entities.dart';
import '../bloc/seed_resolve/seed_resolve_bloc.dart';
import '../bloc/seed_resolve/seed_resolve_event.dart';
import '../bloc/seed_resolve/seed_resolve_state.dart';

/// Manual GROWPICO code entry — route entry point, exported by
/// `public_api.dart`. Resolves through the same [SeedResolveBloc] as the QR
/// scanner.
class GardenCodeScreen extends StatefulWidget {
  const GardenCodeScreen({
    super.key,
    this.onBack,
    this.onClose,
    this.onWhereFindCode,
    required this.onCodeResolved,
  });

  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final VoidCallback? onWhereFindCode;
  final ValueChanged<SeedResolveEntity> onCodeResolved;

  @override
  State<GardenCodeScreen> createState() => _GardenCodeScreenState();
}

class _GardenCodeScreenState extends State<GardenCodeScreen> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.trim().isNotEmpty;
      if (hasText != _hasText) setState(() => _hasText = hasText);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _paste() async {
    final data = await Clipboard.getData('text/plain');
    final text = data?.text;
    if (text == null || text.isEmpty) return;
    _controller
      ..text = text.toUpperCase()
      ..selection = TextSelection.collapsed(offset: _controller.text.length);
  }

  void _submit() {
    final code = _controller.text.trim();
    if (code.isEmpty) return;
    context.read<SeedResolveBloc>().add(SeedCodeResolveRequested(code));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: BaseAppBar(
        title: l10n.addPlantTitle,
        onBack: widget.onBack,
        onClose: widget.onClose,
      ),
      body: SafeArea(
        child: BlocConsumer<SeedResolveBloc, SeedResolveState>(
          listener: (context, state) {
            if (state is SeedResolveSuccess) {
              widget.onCodeResolved(state.resolved);
            }
          },
          builder: (context, state) {
            final isLoading = state is SeedResolveLoading;
            final errorText = state is SeedResolveError ? state.message : null;

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Column(
                children: [
                  const BaseIcon(
                    Icons.qr_code_2,
                    size: 44,
                    color: AppColors.greenDark,
                    backgroundColor: AppColors.greenPale,
                    backgroundSize: 112,
                  ),
                  const BaseGap.v(24),
                  BaseText(
                    l10n.enterGrowPicoCodeHeadline,
                    style: AppTypography.headingM,
                    color: AppColors.greenDark,
                    textAlign: TextAlign.center,
                  ),
                  const BaseGap.v(10),
                  BaseText(
                    l10n.enterGrowPicoCodeDescription,
                    style: AppTypography.bodyM,
                    color: AppColors.textSecondary,
                    textAlign: TextAlign.center,
                  ),
                  const BaseGap.v(24),
                  BaseTextField(
                    controller: _controller,
                    hintText: l10n.seedCodeHint,
                    errorText: errorText,
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.characters,
                    enabled: !isLoading,
                    style: AppTypography.titleM,
                    maxLength: 11,
                    inputFormatters: [_SeedCodeFormatter()],
                    suffixWidget: IconButton(
                      icon: const Icon(
                        Icons.content_paste,
                        color: AppColors.textMuted,
                      ),
                      onPressed: isLoading ? null : _paste,
                    ),
                    onSubmitted: (_) => _submit(),
                  ),
                  const BaseGap.v(24),
                  BaseButton(
                    label: l10n.continueButton,
                    trailingIcon: Icons.arrow_forward,
                    isExpanded: true,
                    isLoading: isLoading,
                    backgroundColor: AppColors.sage,
                    foregroundColor: AppColors.white,
                    onPressed: _hasText && !isLoading ? _submit : null,
                  ),
                  const BaseGap.v(16),
                  TextButton(
                    onPressed: widget.onWhereFindCode,
                    child: BaseText(
                      l10n.whereFindCodeLink,
                      style: AppTypography.labelM,
                      color: AppColors.textSecondary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Uppercases input and inserts a dash after the 5th character, producing
/// `XXXXX-XXXXX`.
class _SeedCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final raw = newValue.text.toUpperCase().replaceAll(
      RegExp(r'[^A-Z0-9]'),
      '',
    );
    final limited = raw.length > 10 ? raw.substring(0, 10) : raw;
    final buffer = StringBuffer();
    for (var i = 0; i < limited.length; i++) {
      if (i == 5) buffer.write('-');
      buffer.write(limited[i]);
    }
    final text = buffer.toString();
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
