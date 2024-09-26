import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../navigation_menu.dart';
import '../../../../vendor/screen/home/home.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// vars
  final signupFormKey = GlobalKey<FormState>();
  final vendorNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final hidePassword = true.obs;
  final confirmPassword = true.obs;
  final isLoading = false.obs;

  /// oninit
  /// build SignUp
  Future<void> buildSignUp() async {
    try {
      /// Start Loading
      isLoading(true);

      /// Check Internet Connectivity
      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        isLoading(false);
        return;
      }

      /// Save Data if Remember Me is selected
      // if (rememberMe.value) {
      //   localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      //   localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      // }

      /// Send login request
      Get.to(
        () => NavigationMenu(),
        transition: Transition.rightToLeft,
      );
    } catch (e) {
      log('Error in Login $e');
    } finally {
      isLoading(false);
    }
  }

  ///
}
