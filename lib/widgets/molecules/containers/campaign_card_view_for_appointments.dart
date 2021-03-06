import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_service_center_app/const/custom_snack_bar.dart';
import 'package:vehicle_service_center_app/controller/appoinment_controller.dart';

import '../../../const/constants.dart';
import '../../../const/widget_size.dart';
import '../../atoms/app_label.dart';

class CampaignCardViewForAppointments extends StatelessWidget {
  final String imgUrl;
  final String vehicleType;
  final String appointmentId;
  final String serviceType;
  final String time;
  final String status;
  //final String time;
  AppointmentController appointmentController =
      Get.find<AppointmentController>();

  CampaignCardViewForAppointments(
      {Key? key,
      required this.vehicleType,
      required this.imgUrl,
      required this.appointmentId,
      required this.time,
      required this.serviceType,
      required this.status
      //required this.time,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBox = GetStorage('userBox');
    var token = userBox.read('token');
    var id = userBox.read('id');

    return SingleChildScrollView(
      child: Card(
          elevation: 9,
          color: Constants.appColorAmberMoreLight,
          shadowColor: Constants.appColorBlack,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              width: double.infinity,
              height: 120,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Image.asset(
                      imgUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      color: Constants.appColorAmberMoreLight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppLabel(
                              text: vehicleType,
                              widgetSize: WidgetSize.large,
                              textColor: Constants.appColorAmberMoreDark,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            /*AppLabel(text: vehicleNo,
                                widgetSize: WidgetSize.medium,
                                textColor: Constants.appColorAmberDark,
                                fontWeight: FontWeight.w500,
                              ),*/

                            AppLabel(
                              text: serviceType,
                              widgetSize: WidgetSize.small,
                              textColor: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            AppLabel(
                              text: time,
                              widgetSize: WidgetSize.medium,
                              textColor: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (status == 'Arrived') {
                                      CustomSnackBar.buildSnackBar(
                                          title: "Alert",
                                          message:
                                              "Your Appointment has been confirmed & can't Change");
                                    } else {
                                      print("appointment id");
                                      print(appointmentId);
                                      appointmentController.addAppointment(
                                          token: token,
                                          id: "$id",
                                          isEdit: true,
                                          appointmentId: appointmentId);
                                    }
                                  },
                                  child: Text('EDIT'),
                                  style: ElevatedButton.styleFrom(
                                    primary: status == 'Arrived'
                                        ? Colors.grey
                                        : Colors.green,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (status == 'Arrived') {
                                      CustomSnackBar.buildSnackBar(
                                          title: "Alert",
                                          message:
                                              "Your Appointment has been confirmed & can't Delete");
                                    } else {
                                      appointmentController.deleteAppointment(
                                          token, appointmentId);
                                    }
                                  },
                                  child: Text('DELETE'),
                                  style: ElevatedButton.styleFrom(
                                    primary: status == 'Arrived'
                                        ? Colors.grey
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
