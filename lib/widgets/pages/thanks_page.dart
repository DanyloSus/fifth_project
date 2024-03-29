import 'package:flutter/material.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPaint(
            size: const Size(200, 200),
            painter: SmileyPainter(),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Thanks for buying!",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width * 0.3, size.height * 0.35), 10, eyePaint);
    canvas.drawCircle(
        Offset(size.width * 0.7, size.height * 0.35), 10, eyePaint);

    final smilePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final smilePath = Path();
    smilePath.moveTo(size.width * 0.3, size.height * 0.6);
    smilePath.quadraticBezierTo(
        size.width / 2, size.height * 0.7, size.width * 0.7, size.height * 0.6);

    canvas.drawPath(smilePath, smilePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
