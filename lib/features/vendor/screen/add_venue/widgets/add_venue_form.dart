import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/common/text_form_field/text_form_field.dart';
import 'package:kick/features/vendor/controller/add_venue/add_venue_controller.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../../../common/custom_image_view.dart';
import '../../../../../common/dropdown_button.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/validators/validator.dart';

class AddVenueForm extends StatelessWidget {
  const AddVenueForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddVenueController());
    return Form(
      key: controller.addVenueFormKey,
      child: Column(
        children: [
          /// name
          CustomTextFormField(
            controller: controller.nameController,
            hintText: 'Venue Name',
            validator: (value) =>
                MyValidator.validateEmptyText('Vendor Name', value),
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 18.h, vertical: 18),
          ),
          SizedBox(height: 10.h),

          /// location
          CustomTextFormField(
            controller: controller.locationController,
            hintText: 'Location',
            validator: (value) =>
                MyValidator.validateEmptyText('Location', value),
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 18.h, vertical: 18),
          ),
          SizedBox(height: 10.h),

          /// categories
          CustomDropDown(
            icon: Container(
              child: CustomImageView(imagePath: AppImages.imgArrowdown),
            ),
            hintText: "Select an option",
            value: 'Venue Categories',
            items: ['Venue Categories', 'Cricket', 'Football'],
            onChanged: (value) {
              controller.selectedCategory.value = value;
            },
            contentPadding:
                EdgeInsets.symmetric(horizontal: 18.h, vertical: 18.h),
          ),
          SizedBox(height: 10.h),

          /// amenities
          CustomTextFormField(
            controller: controller.amenitiesController,
            hintText: 'Amenities',
            validator: (value) =>
                MyValidator.validateEmptyText('Amenities', value),
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 18.h, vertical: 18),
          ),
          SizedBox(height: 50.h),

          /// submit button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                log('Login Button pressed!');
                controller.buildSubmit();
              },
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: AppColors.gray100,
              // ),
              child: Text(
                'Submit',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 16.h,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
