import 'package:flutter/material.dart';

import '../on_bording_screen.dart';

class OnBordingSectionOne extends StatelessWidget {
  const OnBordingSectionOne({super.key, required this.onBordingModel});

  final OnBordingModel onBordingModel;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Image.asset(onBordingModel.image)),
      const SizedBox(height: 40),
      Text(
        onBordingModel.title,
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        onBordingModel.body,
        style: const TextStyle(fontSize: 17),
      ),
      const SizedBox(
        height: 60,
      ),
    ]);
  }
}
