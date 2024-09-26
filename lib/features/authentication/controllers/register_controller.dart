import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find() ;

  /// vars
  final fullname = TextEditingController();
  final phoneNumber = TextEditingController();
  final emailAddress = TextEditingController();  
  /// oninit

  @override
  void onClose() {
    super.onClose();
    fullname.dispose();
    phoneNumber.dispose();
    emailAddress.dispose();
  }
}