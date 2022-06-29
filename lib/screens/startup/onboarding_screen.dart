import 'package:flutter/material.dart';

import '../../widgets/template/startup/on_boarding_template.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingTemplate(
      items: [
        {
          "image":"assets/images/location_one.png",
          "title": "Interim Service",
          "body": "Get the Interim Service checks for the levels of fluids of your vehicle",
        },
        {
          "image":"assets/images/location_three.png",
          "title": "Full Service",
          "body": "Get the Full Service for all interesting points of your vehicle",
        },
        {
          "image":"assets/images/location_two.png",
          "title": "Easy to maintain Servicing Schedules",
          "body": "Maintain your Servicing appointments & Use more Attractive Facilities",
        },
        {
          "image":"assets/images/location_one.png",
          "title": "Payment Options",
          "body": "Easy to select payment options according to your preference",
        },
        {
          "image":"assets/images/location_three.png",
          "title": "Be Connected with our Services",
          "body": "Get in touch with our Vehicle Services & get Notifications, Requests as well",
        },
      ],
    );
  }
}
