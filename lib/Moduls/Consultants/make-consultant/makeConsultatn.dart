import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Helpers/Constants/colors.dart';
import '../../Profile/controller.dart';

class MakeConsultatns extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final RxString selectedType = ''.obs;
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colori.DarkBlue),
        ),
        title: Text(
          "Write your consultant",
          style: TextStyle(color: Colori.maincolor, fontSize: 17),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                width: screenWidth*0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colori.maincolor,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Obx(
                        () => DropdownButton(
                   isExpanded: true,
                      value: selectedType.value.isNotEmpty ? selectedType.value : null,
                      hint: Text('Choose treatment you want to ask about ',style: TextStyle(color: Colori.DarkBlue,fontSize: 13),),
                      onChanged: (newValue) {
                        selectedType.value = newValue!;
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text('Type 1'),
                          value: 'Type 1',
                        ),
                        DropdownMenuItem(
                          child: Text('Type 2'),
                          value: 'Type 2',
                        ),
                        DropdownMenuItem(
                          child: Text('Type 3'),
                          value: 'Type 3',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.only(left: 20.0),
              child: Container(
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
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description..',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.only(left: 20.0),
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colori.maincolor,
                    width: 2.0,
                  ),
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () async {
            File? imageFile = await controller.pickImage();
            if (imageFile != null) {
            // عرض الصورة المحددة للمستخدم (اختياري)
            }
            }, icon: Icon(Icons.drive_folder_upload,color: Colori.DarkBlue,size: 30,)),
                    Text("Upload a photo you want",style: TextStyle(color: Colori.DarkBlue,fontSize: 15),)
                  ],
                )
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding:  EdgeInsets.only(left: 20.0),
              child: InkWell(
                onTap: (){},
                child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colori.DarkBlue,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Done",style: TextStyle(color: Colori.White,fontSize: 17),),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
