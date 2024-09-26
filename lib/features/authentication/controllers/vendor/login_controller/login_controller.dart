import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../navigation_menu.dart';
import '../../../../vendor/screen/home/home.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// var
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = true.obs;
  final isLoading = false.obs;

  ///
  ///
  ///
  ///
  ///
  /// oninit
  @override
  void onInit() {
    super.onInit();
  }

  /// login
  Future<void> buildLogin() async {
    try {
      /// Start Loading
      isLoading(true);

      /// Check Internet Connectivity
      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        isLoading(false);
        return;
      }

      /// Save Data if Remember Me is selected
      // if (rememberMe.value) {
      //   localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      //   localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      // }

      /// Send login request
      log('login Function');
      Get.to( ()=> NavigationMenu(), transition: Transition.rightToLeft, );

    } catch (e) {
      log('Error in Login $e');
    } finally {
      isLoading(false);
    }
  }

  ///
}
