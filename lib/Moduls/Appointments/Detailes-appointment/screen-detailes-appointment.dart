import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconly/iconly.dart';

import '../../../Helpers/Constants/colors.dart';
import '../../../widget/appointmentInfo.dart';

class DetailesAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15.0),
                  // جعل الصورة مربعة الشكل
                  image: DecorationImage(
                    image: AssetImage("assets/image/botox.jpg"),
                    // Replace `productsModel[index].imageUrl` with the actual field containing the image URL in your model
                    fit: BoxFit.cover,
                  ),

                ),
                height: screenHeight * 0.5,
                width: double.infinity,
                //color: Colori.maincolor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 320.0),
                        child: IconButton(onPressed: () {
                          Get.back();
                        }, icon: Icon(Icons.arrow_back,color: Colori.White,)),
                      ),
                      Text(
                        "Appointments Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:20.0),
                        child: Text(
                          "You can see appointment details here about appointment type, time and date",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colori.White, fontSize: 15,shadows: [
                            Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2.0, 2.0),
                          ),
                          ],),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colori.White,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.35, bottom: screenHeight * 0.09, left: screenWidth * 0.12),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: screenWidth * 0.75,
                        decoration: BoxDecoration(
                          color: Colori.maincolor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Save",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colori.White, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colori.White,
                boxShadow: [
                  BoxShadow(
                    color: Colori.maincolor.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              height: screenHeight * 0.5,
              width: screenWidth * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03),
                    child: Text(
                      "Botox Appointment",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colori.maincolor,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  AppointmentInfoRow(
                    icon: IconlyBold.calendar,
                    text: "13/5/2024",
                  ),
                  SizedBox(height: 20),
                  AppointmentInfoRow(
                    icon: IconlyBold.time_circle,
                    text: "6:00 PM",
                  ),
                  SizedBox(height: 20),
                  AppointmentInfoRow(
                    icon: Icons.event_note_outlined,
                    text: "Note ......",
                  ),
                  SizedBox(height: 20),
                  AppointmentInfoRow(
                    icon: Icons.check_circle_outline,
                    text: "Accepted",
                  ),
                  SizedBox(height: 70),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sd_card_alert, color: Colors.red),
                        SizedBox(width: 2),
                        Flexible(
                          child: Text(
                            "If you want to edit or cancel the appointment please call us",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colori.maincolor),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
