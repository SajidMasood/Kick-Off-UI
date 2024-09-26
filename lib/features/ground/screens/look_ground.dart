import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/features/ground/controller/look_ground_controller.dart';
import 'package:kick/utils/constants/app_images.dart';

import '../../../common/custom_image_view.dart';
import '../../../common/dropdown_button.dart';
import '../../../common/text_form_field/text_form_field.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/bg_image.dart';
import '../../../utils/constants/size_utils.dart';
import 'pitches_screen.dart';

class LookGroundScreen extends StatelessWidget {
  const LookGroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LookGroundController());

    return Stack(
      children: [
        /// bg image
        BgImage(),

        /// Scaffold here
        Scaffold(
          backgroundColor: Colors.transparent,

          /// appbar,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Look Ground!',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
          ),

          /// body
          body: SingleChildScrollView(
            child: Container(
              // color: Colors.amberAccent,
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 32.h,
                top: 15.h,
                right: 32.h,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 14.h),
                  _buildGameInfoSection(),

                  /// Dropdown
                  CustomDropDown(
                    icon: Container(
                      margin: EdgeInsets.only(left: 16.h),
                      child: CustomImageView(
                        imagePath: AppImages.imgArrowdown,
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // iconSize: 20.h,

                    hintText: "Select an option",
                    value: 'All Sports',
                    items: ['All Sports', 'Cricket', 'Football'],
                    onChanged: (value) {
                      controller.selectedSport.value = value;
                    },
                    contentPadding: EdgeInsets.fromLTRB(12.h, 8.h, 14.h, 8.h),
                  ),
                  SizedBox(height: 10.h),
                  CustomDropDown(
                    icon: Container(
                      margin: EdgeInsets.only(left: 16.h),
                      child: CustomImageView(
                        imagePath: AppImages.imgArrowdown,
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // iconSize: 22.h,
                    hintText: "Select Area",
                    value: 'Area',
                    items: ['Area', 'Ground'],
                    onChanged: (value) {
                      controller.selectedArea.value = value;
                    },
                    contentPadding: EdgeInsets.fromLTRB(12.h, 8.h, 14.h, 8.h),
                  ),
                  SizedBox(height: 10.h),
                  CustomDropDown(
                    icon: Container(
                      margin: EdgeInsets.only(left: 16.h),
                      child: CustomImageView(
                        imagePath: AppImages.imgArrowdown,
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // iconSize: 22.h,
                    hintText: "Selected Venue",
                    value: 'Venue',
                    items: ['Venue', 'Hall'],
                    onChanged: (value) {
                      controller.selectedVenue.value = value;
                    },
                    contentPadding: EdgeInsets.fromLTRB(12.h, 8.h, 14.h, 8.h),
                  ),
                  SizedBox(height: 10.h),

                  /// time
                  CustomTextFormField(
                    readOnly: true,
                    controller: controller.timeInputController,
                    hintText: '17:15',
                    suffix: Container(
                      margin: EdgeInsets.fromLTRB(16.h, 8.h, 14.h, 8.h),
                      child: CustomImageView(
                        imagePath: AppImages.imgClock,
                        height: 22.h,
                        width: 20.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: 42.h,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(12.h, 8.h, 14.h, 8.h),
                    // borderDecoration: TextFormFieldStyleHelper.outlinePrimary,
                    filled: true,
                    fillColor: AppColors.gray50,
                    borderDecoration: InputBorder.none,

                    onTap: () {
                      log('message');
                      controller.onTapTimeInput(context);
                    },
                  ),
                  SizedBox(height: 10.h),

                  /// date
                  CustomTextFormField(
                    readOnly: true,
                    controller: controller.dateInputController,
                    hintText: "16-02-2024",
                    textInputAction: TextInputAction.done,
                    suffix: Container(
                      margin: EdgeInsets.fromLTRB(16.h, 8.h, 14.h, 8.h),
                      child: CustomImageView(
                        imagePath: AppImages.imgCalendar,
                        height: 22.h,
                        width: 20.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: 42.h,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(12.h, 8.h, 14.h, 8.h),
                    borderDecoration: InputBorder.none,
                    filled: true,
                    fillColor: AppColors.gray50,
                    onTap: () {
                      log('message');
                      controller.onTapDateInput(context);
                    },
                  ),
                  SizedBox(height: 30.h),
                  //SEARCH ALL AVAILABLE PITCHES & BOOKING ONLINE
                  Text(
                    "SEARCH ALL AVAILABLE PITCHES & BOOKING ONLINE",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: AppColors.gray50,
                          fontSize: 11.fSize,
                        ),
                  ),
                  SizedBox(height: 5.h),

                  /// Go Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        onPressed: () {},
                        child: Text(
                          'GO',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(height: 12.h),

                  /// OUR FEATURED PITCHES
                  _buildFeaturedPitchSection(),
                  // SizedBox(height: 14.h),

                  ///
                ],
              ),
            ),
          ),

          ///
        ),
      ],
    );
  }

  _buildGameInfoSection() {
    return Container(
      // color: Colors.blueAccent,
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4.h),
      child: Column(
        children: [
          /// Get Your Game On
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'GET YOUR ',
                  style:
                      Theme.of(Get.context!).textTheme.headlineLarge!.copyWith(
                            color: AppColors.gray50,
                            fontWeight: FontWeight.w500,
                          ),
                ),
                TextSpan(
                  text: "GAME ",
                  style: Theme.of(Get.context!).textTheme.headlineLarge,
                ),
                TextSpan(
                  text: 'ON',
                  style:
                      Theme.of(Get.context!).textTheme.headlineLarge!.copyWith(
                            color: AppColors.gray50,
                            fontWeight: FontWeight.w500,
                          ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "LOOKING TO PLAY SPORTS IN KARACHI ?",
            style: Theme.of(Get.context!).textTheme.titleMedium!.copyWith(
                  color: AppColors.gray50,
                  fontSize: 16.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: 20.h),

          ///
        ],
      ),
    );
  }

  _buildFeaturedPitchSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "OUR FEATURED PITCHES",
          style: Theme.of(Get.context!).textTheme.titleSmall!.copyWith(
                fontFamily: 'inter',
                color: AppColors.gray50,
              ),
        ),
        SizedBox(height: 10.h),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(right: 4.h),
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 4.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.gray50,
            borderRadius: BorderRadius.circular(3.h),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: AppImages.imgRectangle39,
                height: 164.h,
                width: double.maxFinite,
                radius: BorderRadius.circular(
                  3.h,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "KARACHI HEIGHTS ACADEMY",
                style: Theme.of(Get.context!).textTheme.labelLarge!.copyWith(
                      color: AppColors.primary,
                      fontSize: 12.fSize,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 3.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Location: ",
                      style: Theme.of(Get.context!)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    TextSpan(
                      text: "Al Barsha South",
                      style: Theme.of(Get.context!).textTheme.bodySmall,
                    )
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 3.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Price: ",
                      style: Theme.of(Get.context!)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    TextSpan(
                      text: "4000PK/hr",
                      style: Theme.of(Get.context!).textTheme.bodySmall,
                    )
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 3.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Surface: ",
                      style: Theme.of(Get.context!)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    TextSpan(
                      text: "4G Astro Turf",
                      style: Theme.of(Get.context!).textTheme.bodySmall,
                    )
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 14.h),
              _buildViewButton(),
            ],
          ),
        ),
      ],
    );
  }

  _buildViewButton() {
    return Container(
      // color: Colors.amber,
      width: double.infinity / 2,
      padding: EdgeInsets.only(
        left: 80.h,
        right: 74.h,
      ),
      child: ElevatedButton(
        onPressed: () {
          log('tapped on view button!');
          Get.to(() => const PitchesScreen(),
              transition: Transition.rightToLeft);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: Text(
          'View',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
