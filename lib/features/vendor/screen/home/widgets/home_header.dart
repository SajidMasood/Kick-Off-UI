import 'package:flutter/material.dart';
import 'package:kick/utils/constants/size_utils.dart';

import '../../../../../utils/constants/app_images.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo and Welcome Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey canyamen!',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            SizedBox(height: 10.h),
            Text('Let us help you stay organized',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                    )),
          ],
        ),

        // Profile Picture
        CircleAvatar(
          radius: 25.h,
          backgroundImage: AssetImage(AppImages.logo), // Your profile pic
        ),
      ],
    );
  }
}
