import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';

/// Decorative scanning frame drawn over the camera preview: four green
/// corner brackets around a square viewfinder.
class QrScannerFrame extends StatelessWidget {
  const QrScannerFrame({super.key, this.size = 240, this.strokeWidth = 4});

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CornerPainter(
          color: AppColors.greenBright,
          strokeWidth: strokeWidth,
          cornerLength: size * 0.16,
        ),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  const _CornerPainter({
    required this.color,
    required this.strokeWidth,
    required this.cornerLength,
  });

  final Color color;
  final double strokeWidth;
  final double cornerLength;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    void corner(Offset origin, Offset dx, Offset dy) {
      canvas.drawLine(origin, origin + dx, paint);
      canvas.drawLine(origin, origin + dy, paint);
    }

    final l = cornerLength;
    corner(const Offset(0, 0), Offset(l, 0), Offset(0, l));
    corner(Offset(size.width, 0), Offset(-l, 0), Offset(0, l));
    corner(Offset(0, size.height), Offset(l, 0), Offset(0, -l));
    corner(Offset(size.width, size.height), Offset(-l, 0), Offset(0, -l));
  }

  @override
  bool shouldRepaint(covariant _CornerPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.cornerLength != cornerLength;
}
