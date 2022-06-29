import 'package:flutter/material.dart';
import 'package:vehicle_service_center_app/widgets/molecules/containers/drawer.dart';

import '../../../const/constants.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.appColorAmberDark,
        elevation: 0,
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 19,
          ),
        ),
      ),

      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Text(
                "DP AutoCare",
                style: TextStyle(
                  color: Constants.appColorAmberMoreDark,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5,),

            Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "This privacy statement explains how DP AutoCare uses and safeguards any information you provide when using this mobile application. Your privacy is important to DP AutoCare, and we take that responsibility seriously.",
                  textAlign : TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Constants.appColorAmberDark,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    'What we collect : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Constants.appColorAmberMoreDark,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12,),

            Text(
              '1.Name\n\n2.Vehicle Details\n\n3.E-mail Address\n\n4.Contact Details\n\n5.Vehicle Selling Details',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
              ),
            ),

            SizedBox(height: 40,),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    'What we do with gathered info : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Constants.appColorAmberMoreDark
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 14,),

            Text(
              '1.We may send service completion emails\n\n'
                  '2.We will never sell your information\n\n'
                  '3.For Internal record keeping.\n\n',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
