import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/features/vendor/controller/manage_calendar_controller/manage_calendar_controller.dart';
import 'package:kick/utils/constants/bg_image.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../../common/app_bar/app_bar.dart';
import '../../../../utils/constants/app_images.dart';
import 'widgets/calender_item.dart';

class ManageCalendarScreen extends StatelessWidget {
  const ManageCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageCalendarController());
    return Stack(
      children: [
        BgImage(),
        Scaffold(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),

          /// appbar
          appBar: CustomAppBar(
            bgColor: Colors.transparent,
            leadingIcon: AppImages.drawarIcon,
            centerTitle: true,
            title: Text(
              'Manage Calender',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontSize: 20.h),
            ),
          ),

          /// main content
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              //physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.days.length,
              separatorBuilder: (_, __) => SizedBox(height: 30.h),
              itemBuilder: (_, index) {
                return CalenderItem(
                  daySchedule: controller.days[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
