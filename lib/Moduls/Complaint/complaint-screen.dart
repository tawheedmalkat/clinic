import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../Helpers/Constants/colors.dart';

class ComplaintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
              child: Image.asset(
                "assets/image/img.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
              child: Text(
                "We're always looking for ways to improve! How can we enhance your experience with our app or with Dr. Samer Mourad",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colori.DarkBlue),
              ),
            ),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                border: Border.all(
                  color: Colori.maincolor,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.01),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Write a complaint or a suggestion..',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            InkWell(
              onTap: () {},
              child: Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colori.maincolor,
                ),
                child: Center(
                  child: Text(
                    "Send",
                    style: TextStyle(color: Colori.White, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
