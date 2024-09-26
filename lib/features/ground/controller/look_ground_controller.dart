import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LookGroundController extends GetxController {
  static LookGroundController get instance => Get.find();

  /// vars
  var selectedSport = ''.obs;
  var selectedArea = ''.obs;
  var selectedVenue = ''.obs;
  final timeInputController = TextEditingController();
  final dateInputController = TextEditingController();

  /// oninit
  @override
  void onInit() {
    super.onInit();
    // Set current time to timeInputController
    setCurrentTime();
    setCurrentDate();
  }

  void setCurrentTime() {
    String formattedTime = DateFormat('HH:mm').format(DateTime.now());
    timeInputController.text = formattedTime;
  }

  void setCurrentDate() {
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    dateInputController.text = formattedDate;
  }

  /// get time from user
  Future<void> onTapTimeInput(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final selectedTime = DateTime(
          now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      String formattedTime = DateFormat('HH:mm').format(selectedTime);
      timeInputController.text = formattedTime;
    }
  }

  /// Function to pick date from user
  Future<void> onTapDateInput(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      dateInputController.text = formattedDate;
    }
  }

  ///
}
