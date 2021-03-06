import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vehicle_service_center_app/screens/auth/sign_up_screen.dart';

import '../../../const/constants.dart';

class OnBoardingTemplate extends StatelessWidget {
  final List<Map<String, String>> items;

  OnBoardingTemplate({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: items
              .map((item) => PageViewModel(
                  title: item['title'],
                  body: item['body'],
                  image: buildImage(item['image']!),
                  decoration: getPageDecoration()))
              .toList(),

          done: const Text('START',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Constants.appColorAmberMoreDark)),
          onDone: () {
            goToHome(context);
          },
          showSkipButton: true,
          skip: const Text(
            'SKIP',
            style: TextStyle(color: Constants.appColorBlack),
          ),
          onSkip: () {
            goToHome(context);
          },
          next: const Text("NEXT",
              style: TextStyle(
                  color:
                      Constants.appColorBlack)), //Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          skipFlex: 0,
          nextFlex: 0,
        ),
      ),
    );
  }

  void goToHome(context) {
    print("moved to signup page");
    //Constants().setAppInstalledDataInSF(Constants.IS_APP_INSTALLED, true);
    final userBox = GetStorage('userBox');
    userBox.write('is_installed', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SignUpScreen()),
    );
  }

  Widget buildImage(String path) {
    return Center(
      child: Image.asset(
        path,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          color: Constants.appColorAmberMoreDark,
        ),
        bodyTextStyle: TextStyle(fontSize: 16, color: Constants.appColorAmberDark, fontStyle: FontStyle.italic),
        descriptionPadding: EdgeInsets.all(0).copyWith(bottom: 0),
        imagePadding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
        pageColor: Colors.transparent,
        imageFlex: 2);
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Constants.appColorGray,
        activeColor: Constants.appColorAmberDark,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
}
