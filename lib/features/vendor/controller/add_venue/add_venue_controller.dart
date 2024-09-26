import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screen/view_listing/view_listing.dart';

class AddVenueController extends GetxController {
  static AddVenueController get instance => Get.find();

  /// vars
  final addVenueFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final amenitiesController = TextEditingController();
  var selectedCategory = ''.obs;

  final isLoading = false.obs;

  /// oninit

  /// build SignUp
  Future<void> buildSubmit() async {
    try {
      /// Start Loading
      isLoading(true);

      /// Check Internet Connectivity
      /// Form Validation
      // if (!addVenueFormKey.currentState!.validate()) {
      //   isLoading(false);
      //   return;
      // }

      /// Save Data if Remember Me is selected
      // if (rememberMe.value) {
      //   localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      //   localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      // }

      /// Send login request
      Get.to(
        () => ViewListingScreen(),
        transition: Transition.rightToLeft,
      );
    } catch (e) {
      log('Error in Login $e');
    } finally {
      isLoading(false);
    }
  }
}
