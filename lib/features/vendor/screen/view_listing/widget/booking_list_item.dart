import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kick/common/custom_image_view.dart';
import 'package:kick/utils/constants/app_colors.dart';
import 'package:kick/utils/constants/app_images.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../model/booking_list/boking_list_model.dart';
import '../../manage_calender/manage_calender.dart';

class BookingListItemWidget extends StatelessWidget {
  const BookingListItemWidget({super.key, required this.bookingItem});

  final BookingListItemModel bookingItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min ,
        children: [
          /// 1.  Booking ID Row
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.apple,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking ID',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                  ),
                  Text(
                    bookingItem.bookingIdNumber,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10.h),

          /// 2.  Venue Row
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.apple,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Venue Name',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    bookingItem.venueTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),

          /// Date Row
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.apple,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    bookingItem.date,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),

          /// Status Row
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.apple,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    bookingItem.StatusTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),

          /// Created At Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: AppImages.apple,
                      height: 24.h,
                      width: 24.h,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created At',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14.fSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        Text(
                          bookingItem.createAt,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 12.fSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Manage Calendar Button
              SizedBox(
                height: 34,
                child: ElevatedButton(
                  onPressed: () {
                    log('Manage Calendar Button');
                    Get.to(() => ManageCalendarScreen(),
                        transition: Transition.rightToLeft);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.h),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: Text(
                    'Manage Calendar',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 12.fSize,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Hind',
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
