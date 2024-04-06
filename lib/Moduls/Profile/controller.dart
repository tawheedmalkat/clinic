import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with SingleGetTickerProviderMixin {
  late int myProfIndex;
  late PageController pageController;
  late AnimationController animationController;
  late File? imageFile = null;

// Initialize imageFile with null

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update(); // Update the UI to reflect the selected image
    } else {
      print('No image selected.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    myProfIndex = 0;
    pageController = PageController(initialPage: myProfIndex);
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  void changeMyProfIndex(int index) {
    myProfIndex = index;
    pageController.jumpToPage(index);
    update();
  }

  @override
  void dispose() {
    pageController.dispose();
    animationController.dispose();
    super.dispose();
  }


}
