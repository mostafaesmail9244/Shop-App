import 'package:flutter/material.dart';
import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/core/services/locale/cache_helper.dart';
import 'package:store_app/features/auth/presentation/views/widgets/on_bording_section_one.dart';
import 'package:store_app/features/auth/presentation/views/widgets/on_bording_section_tow.dart';

import '../../../../core/utils/app_router.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  var controller = PageController();
  bool isLast = false;
  List<OnBordingModel> onBordingList = [
    OnBordingModel(
        title: 'Screen Title one',
        image: 'assets/images/onBording.png',
        body: 'Screen body one'),
    OnBordingModel(
        title: 'Screen Title tow',
        image: 'assets/images/onBording.png',
        body: 'Screen body tow'),
    OnBordingModel(
        title: 'Screen Title three',
        image: 'assets/images/onBording.png',
        body: 'Screen body three'),
  ];
  void submit() {
    CacheHelper.saveData(key: Constant.kOnBoarding, value: true).then(
      (value) => {
        if (value)
          {
            Navigator.pushReplacementNamed(context, AppRouter.kLoginScreen),
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: submit,
            child: const Text(
              'Skip',
              style: TextStyle(color: Constant.defaultColor),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  if (value == onBordingList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  }
                },
                itemBuilder: (context, index) => OnBordingSectionOne(
                  onBordingModel: onBordingList[index],
                ),
                itemCount: onBordingList.length,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            OnBordingSectionTow(
                controller: controller,
                submit: submit,
                onBordingList: onBordingList,
                isLast: isLast)
          ],
        ),
      ),
    );
  }
}


class OnBordingModel {
  final String title;
  final String image;
  final String body;

  OnBordingModel(
      {required this.title, required this.image, required this.body});
}
