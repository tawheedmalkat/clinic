import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../Helpers/Constants/colors.dart';
import '../../widget/Custom-Action.dart';
import '../Profile/controller.dart';
import 'Content/all-screen.dart';
import 'Content/past-Page.dart';
import 'Content/upcoming-page.dart';

class AppointmentScreen extends StatelessWidget {
  List<String> myprofile = [
    "All",
    "UpComing",
    "Past",
  ];

  final ScrollController _scrollController = ScrollController();
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          actions: [
          CustomAppBarActions(controller: controller),
          ],
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {

              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colori.DarkBlue,

            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome.Back!",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  Text(
                    "P.Maya Alhusien",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Appointments",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "Today,Wed 10 Oct",
                              style: TextStyle(
                                color: Colori.maincolor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyBold.calendar,
                          color: Colori.maincolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.09, // Adjust the height here
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      controller.changeMyProfIndex(index);
                    },
                    child: Container(
                      width: 120,
                      margin: EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.09, // Adjust the height here
                      decoration: BoxDecoration(
                        color: controller.myProfIndex == index ? Colori.maincolor : Colori.White,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: controller.myProfIndex == index ? 3.0 : 1.0,
                          color: controller.myProfIndex == index ? Colori.maincolor : Colors.transparent,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          myprofile[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.myProfIndex == index ? Colori.White : Colori.DarkBlue,
                            fontWeight: controller.myProfIndex == index ? FontWeight.bold : FontWeight.bold,
                            fontSize: controller.myProfIndex == index ? 17 : 15,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: myprofile.length,
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.changeMyProfIndex(index);
                },
                children: [
                  ALLScreen(),

                  UpComingPage(),
                  PastPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
