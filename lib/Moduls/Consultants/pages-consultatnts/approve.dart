import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

import '../../../Helpers/Constants/colors.dart';
import '../../Profile/controller.dart';

class Approved extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colori.maincolor,
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Colori.GreyLight,
                                  width: 5.0,
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  File? imageFile =
                                      await controller.pickImage();
                                  if (imageFile != null) {
                                    // Update the image directly here
                                    // controller.setImageFile(imageFile);
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.blueGrey.withOpacity(0.1),
                                  radius: 20,
                                  backgroundImage: controller.imageFile != null
                                      ? FileImage(controller.imageFile!)
                                      : null,
                                  child: controller.imageFile == null
                                      ? Icon(
                                          Icons.person,
                                          size: 20,
                                          color: Colori.DarkBlue,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Maya ALhusien",
                              style: TextStyle(
                                  color: Colori.DarkBlue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: screenWidth * 0.32,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.greenAccent,
                                  size: 10,
                                ),
                                Text(
                                  "Approved",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: screenWidth * 0.8,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          // جعل الصورة مربعة الشكل
                          image: DecorationImage(
                            image: AssetImage("assets/image/Filler.jpg"),
                            // Replace `productsModel[index].imageUrl` with the actual field containing the image URL in your model
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                        child: Text("I had Filler injection two months ago and"
                            " the results are starting to fade. "
                            "Would it be possible to schedule another "
                            "appointment for a touch-up?"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colori.maincolor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Doctor",
                              style: TextStyle(
                                  color: Colori.DarkBlue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "yes you have to take an appointment"
                                  "and come for a touch-up",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Today,Wed 10 Oct",
                                  style: TextStyle(
                                    color: Colori.maincolor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 20.0,left: 250),
                        child: Row(
                          children: [

                            Image.asset("assets/image/like-removebg-preview.png",
                              fit: BoxFit.cover,width: 40,height: 40,color: Colors.blue,),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.comment,color: Colors.red,size: 30,)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),


          );
        },
        itemCount: 7,

        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.transparent,
          );
        },
      ),
    );
  }
}
