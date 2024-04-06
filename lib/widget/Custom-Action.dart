import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helpers/Constants/colors.dart';
import '../Moduls/Profile/controller.dart';

class CustomAppBarActions extends StatelessWidget {
  final ProfileController controller;

  const CustomAppBarActions({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.app_registration,
            color: Colori.maincolor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.0, left: 5),
          child: Container(
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
                File? imageFile = await controller.pickImage();
                if (imageFile != null) {
                  // Update the image directly here
                  // controller.setImageFile(imageFile);
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey.withOpacity(0.1),
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
        ),
      ],
    );
  }
}