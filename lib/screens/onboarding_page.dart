import 'package:flutter/material.dart';
import 'package:travelwave/screens/login_page.dart';
import 'package:travelwave/widgets/onboarding_widget.dart';
import 'dart:math';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  double progress = 0.35;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xff414141),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: PageView(
              children: [
                onboardingWidget(
                  'Anywhere you are',
                  'Our ridesharing service is ready to take you there safely and conveniently.',
                  '01_onboarding.png',
                ),
                onboardingWidget(
                  'At anytime',
                  'You can rely on our ridesharing service to provide you with a ride, day or night.',
                  '02_onboarding.png',
                ),
                onboardingWidget(
                  'Book your car',
                  'Enjoy a comfortable ride to your destination with our ridesharing service.',
                  '03_onboarding.png',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 105,
            width: 105,
            child: CustomPaint(
              painter: CirclePainter(progress),
              child: Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      progress += 0.35;
                      if (progress > 1.0) {
                        progress = 1.0;
                      }
                    });
                  },
                  child: Container(
                    width: 86,
                    height: 86,
                    decoration: BoxDecoration(
                      color: const Color(0xffFEC400),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 30,
                      weight: 100,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double progress;

  CirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xffFEC400)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    double sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
