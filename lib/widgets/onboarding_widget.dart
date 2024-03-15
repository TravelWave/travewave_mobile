import 'package:flutter/material.dart';

Widget onboardingWidget(String title, String content, String img) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 50),
        Image.asset('assets/$img'),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFA0A0A0),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
