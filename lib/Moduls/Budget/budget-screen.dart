import 'package:clinic/Moduls/Budget/budget-pages/payments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../Helpers/Constants/colors.dart';
import '../Profile/controller.dart';
import 'budget-pages/pointers.dart';
import 'budget-pages/rest.dart';

class Budget extends StatelessWidget {
  List<Map<String, dynamic>> budget = [
    {"name": "Payments", "icon": Icons.monetization_on,}, // Example Icon: money
    // Example Icon: arrowDownCircle
    {"name": "Points", "icon": IconlyBold.document},
    {"name": "Rest", "icon": IconlyBold.wallet,},// Example Icon: document
  ];

  final ScrollController _scrollController = ScrollController();
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ProfileController>(
        builder: (controller) => Scaffold(
          body: Stack(
            children: [
              // Container for app bar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.15,
                  color: Colori.maincolor,
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colori.White,
                            ),
                          ),
                        ),
                        Text(
                          'Payment',
                          style: TextStyle(color: Colori.White, fontSize: 18),
                        ),
                        Spacer(), // Add this to push the next IconButton to the right
                        Padding(
                          padding: EdgeInsets.only(right: 5.0), // Adjust the right padding as needed
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.info_outline,
                              color: Colori.White,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container for body
              Positioned(
                top: screenHeight * 0.12,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colori.White,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),

                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        height: 250,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colori.White.withOpacity(0.8), // لون البداية
                              Colori.maincolor.withOpacity(0.5), // لون النهاية
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: 50,left: 30),
                              child: Text("Current operation budget",style: TextStyle(color: Colori.DarkBlue,fontWeight: FontWeight.bold,fontSize: 17),),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 30,bottom: 65),
                              child: Text("\$${300.67822}"
                                ,style:
                                TextStyle(color: Colori.maincolor,fontWeight: FontWeight.bold,fontSize: 30),),

                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.sd_card_alert, color: Colors.red),
                                  SizedBox(width: 2),
                                  Flexible(
                                    child: Text(
                                      "If you want to complete the amounts or pay please contact with secretary.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colori.DarkBlue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
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
                                height: MediaQuery.of(context).size.height * 0.07, // Adjust the height here
                                decoration: BoxDecoration(
                                  color: controller.myProfIndex == index ? Colori.White: Colori.White,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    width: controller.myProfIndex == index ? 3.0 : 1.0,
                                    color: controller.myProfIndex == index ? Colori.maincolor : Colori.DarkBlue,
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        budget[index]["icon"],
                                        color: controller.myProfIndex == index ? Colori.DarkBlue : Colori.DarkBlue,
                                      ),
                                      SizedBox(width: 5), // Add some space between icon and text
                                      Text(
                                        budget[index]["name"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: controller.myProfIndex == index ? Colori.DarkBlue : Colori.DarkBlue,
                                          fontWeight: controller.myProfIndex == index ? FontWeight.bold : FontWeight.bold,
                                          fontSize: controller.myProfIndex == index ? 17 : 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: budget.length,
                        ),
                      ),

                      SizedBox(height: 10),
                      Expanded(
                        child: PageView(
                          controller: controller.pageController,
                          onPageChanged: (index) {
                            controller.changeMyProfIndex(index);
                          },
                          children: [
                            PaymentsScreen(),

                            Pointers(),
                            Rest(),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
