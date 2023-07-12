import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constant/constant.dart';
import '../on_bording_screen.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.controller,
    required this.onBordingList,
  });

  final PageController controller;
  final List<OnBordingModel> onBordingList;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onBordingList.length,
      effect: const JumpingDotEffect(
          dotWidth: 20.0,
          dotHeight: 10.0,
          spacing: 10.0,
          activeDotColor: Constant.defaultColor),
    );
  }
}
