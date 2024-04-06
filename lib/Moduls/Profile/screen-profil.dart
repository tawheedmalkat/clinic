import 'dart:io';

import 'package:clinic/Moduls/Appointments/appointment-screen.dart';
import 'package:clinic/Moduls/Budget/budget-screen.dart';
import 'package:clinic/Moduls/Complaint/complaint-screen.dart';
import 'package:clinic/Moduls/Consultants/consultant-screen.dart';
import 'package:clinic/Moduls/SettingsFolder/Settingscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Helpers/Constants/colors.dart';
import 'controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());
  bool showContactIcons = false;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: Text(
              "Profile".tr,
              textAlign: TextAlign.center,
            ),
          ),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: 50,bottom: 20),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 110,
                              // تحديد عرض الـ Container بحسب الحجم المطلوب لـ CircleAvatar
                              height: 110,
                              // تحديد ارتفاع الـ Container بحسب الحجم المطلوب لـ CircleAvatar
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, // جعل الـ Container دائريًا
                                color: Colori.White, // لون خلفية الصورة
                                border: Border.all(
                                    color: Colori.DarkBlue,
                                    width: 5.0), // إضافة الحدود
                              ),
                              child:
                             InkWell(
                                onTap: () async {
                                  File? imageFile = await controller.pickImage();
                                  if (imageFile != null) {
                                    // Update the image directly here
                                    // controller.setImageFile(imageFile);
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.blueGrey.withOpacity(0.1),
                                  radius: 50,
                                  backgroundImage: controller.imageFile != null
                                      ? FileImage(controller.imageFile!)
                                      : null,
                                  child: controller.imageFile == null
                                      ? Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colori.DarkBlue,
                                  )
                                      : null,
                                ),
                              ),
                            ),
                            ],
                        ),
                        SizedBox(
                          height: 30,
                        ),

                            Text(
                              'Maya ALHusien'.tr,
                              style: TextStyle(
                                fontSize: 20,
                                  color: Colori.DarkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Anta"),
                            ),


                      ],
                    ),
                  ),



                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        switch (index) {
                          case 0:
                            return ListTile(
                              title: Text("Edit Profile".tr
                                ,style: TextStyle(color: Colori.maincolor),),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colori.DarkBlue,
                                ),
                                onPressed: () {
                                  // Handle onPressed for Products
                                },
                              ),
                              leading: Icon(
                                IconlyBold.profile,
                                color: Colori.DarkBlue,
                              ),
                            );
                          case 1:
                            return ListTile(
                              title: Text("Appointments".tr,style: TextStyle(color: Colori.maincolor),),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colori.DarkBlue,
                                ),
                                onPressed: () {
                                  Get.to(AppointmentScreen ());
                                  // Handle onPressed for Password
                                },
                              ),
                              leading: Icon(
                                IconlyBold.calendar,
                                color: Colori.DarkBlue,
                              ),
                            );
                          case 2:
                            return ListTile(
                              title: Text("Consultants".tr,style: TextStyle(color: Colori.maincolor),),
                              trailing: IconButton(
                                icon: Icon(Icons.arrow_forward_ios,
                                  color: Colori.DarkBlue,
                                ),
                                onPressed: () {
                                  Get.to(ConsultantsScreen());
                                  // Handle onPressed for Products
                                },
                              ),
                              leading: Icon(
                                IconlyBold.activity,
                                color: Colori.DarkBlue,
                              ),
                            );
                          case 3:
                            return ListTile(
                              title: Text("budget".tr,style: TextStyle(color: Colori.maincolor),),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colori.DarkBlue,
                                ),
                                onPressed: () {
                                  Get.to(Budget());
                                  // Handle onPressed for Ads
                                },
                              ),
                              leading: Icon(
                                Icons.wallet_giftcard,
                                color: Colori.DarkBlue,
                              ),
                            );
                          case 4:
                            return ListTile(
                              title: Text("Complaint".tr,style: TextStyle(color: Colori.maincolor),),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colori.DarkBlue,
                                ),
                                onPressed: () {
                                  Get.to(ComplaintScreen());
                                  // Handle onPressed for Ads
                                },
                              ),
                              leading: Icon(
                                Icons.help_outline,
                                color: Colori.DarkBlue,
                              ),
                            );
                          case 5:
                            return ListTile(
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colori.DarkBlue,
                                ),
                                onPressed: () {
                                  Get.to(SettingsScreen());
                                  // Handle onPressed for Products
                                },
                              ),
                              title: Text(
                                'Settings'.tr,
                                style: TextStyle(color: Colori.maincolor),
                              ),
                              leading: Icon(
                                size: 30,
                                Icons.settings,
                                color: Colori.DarkBlue,
                              ),
                            );
                          case 6:
                            return ListTile(
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colori.DarkBlue,
                                ),
                                onPressed: () {
                                  // Handle onPressed for Products
                                },
                              ),
                              title: Text(
                                'Log out'.tr,
                        style: TextStyle(color: Colori.maincolor),
                              ),
                              leading: Icon(
                                size: 30,
                                Icons.logout,
                                color: Colori.DarkBlue,
                              ),
                            );
                          default:
                            return SizedBox.shrink();
                        }
                      },
                      itemCount: 7, // تم تعديل عدد العناصر إلى 6
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showContactIcons = !showContactIcons;
                      });
                    },
                    child: Container(
                      color: Colors.grey.withOpacity(0.1),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Contact Us'.tr,
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          SizedBox(width: 3,),
                          Icon(Icons.ads_click,color:  Colors.red,),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: showContactIcons ? 80 : 0,
                    curve: Curves.easeInOut,
                    child: showContactIcons
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/image/Whatsapp.png",width: 35, // العرض المطلوب
                          height: 35,)
                        ,
                        Image.asset("assets/image/instgrame.png",width: 35, // العرض المطلوب
                          height: 35,),
                        IconButton(
                          icon: Icon(Icons.phone,color: Colori.maincolor,size: 35,),
                          onPressed: () {
                            // Handle phone button press
                          },
                        ),

                        IconButton(
                          icon: Icon(Icons.facebook,color: Colors.blue,size: 35
                            ,),
                          onPressed: () {
                            // Handle facebook button press
                          },
                        ),
                      ],
                    )
                        : null,
                  ),
                ],
              ),
            ),
                ],
              ),
            ),






    );
  }
}
