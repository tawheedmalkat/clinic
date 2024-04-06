import 'package:clinic/Moduls/Consultants/make-consultant/makeConsultatn.dart';
import 'package:clinic/Moduls/Consultants/pages-consultatnts/approve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../Helpers/Constants/colors.dart';
import '../Appointments/Content/all-screen.dart';
import '../Appointments/Content/past-Page.dart';
import '../Appointments/Content/upcoming-page.dart';
import '../Profile/controller.dart';
class ConsultantsScreen extends StatelessWidget {
  List<String> consultants = [
     "approved",// Example Icon: money
    // Example Icon: arrowDownCircle
   "pending",
  "rejected", // Example Icon: document
  ];final ScrollController _scrollController = ScrollController();
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Get.to(MakeConsultatns());
          },icon: Icon(Icons.edit_note_outlined,color: Colori.maincolor,),)],
        leading: IconButton(
          onPressed: (){Get.back();},
          icon: Icon(Icons.arrow_back,color: Colori.DarkBlue,),
        ),
        title: Text("Consultants",style: TextStyle(color: Colori.maincolor,fontSize: 20),textAlign: TextAlign.center,),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding:  EdgeInsets.only(left: 30.0),
            child: SizedBox(
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
                      width: 90,
                      margin: EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.09, // Adjust the height here
                      decoration: BoxDecoration(
                        color: controller.myProfIndex == index ? Colori.maincolor : Colori.White,
                        borderRadius: BorderRadius.circular(30),
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
                          consultants[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.myProfIndex == index ? Colori.White : Colori.DarkBlue,
                            fontWeight: controller.myProfIndex == index ? FontWeight.bold : FontWeight.bold,
                            fontSize: controller.myProfIndex == index ? 16 : 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: consultants.length,
              ),
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
                Approved(),

                UpComingPage(),
                PastPage(),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
