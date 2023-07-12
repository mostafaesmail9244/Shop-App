import 'package:flutter/material.dart';

import '../on_bording_screen.dart';
import 'indicator.dart';

class OnBordingSectionTow extends StatelessWidget {
  const OnBordingSectionTow({
    super.key,
    required this.controller,
    required this.submit,
    required this.onBordingList,
    required this.isLast,
  });

  final PageController controller;
  final List<OnBordingModel> onBordingList;
  final bool isLast;
  final Function submit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Indicator(controller: controller, onBordingList: onBordingList),
        const Spacer(),
        FloatingActionButton(
          onPressed: () {
            if (isLast) {
              submit();
            } else {
              controller.nextPage(
                  duration: const Duration(microseconds: 750),
                  curve: Curves.bounceIn);
            }
          },
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
