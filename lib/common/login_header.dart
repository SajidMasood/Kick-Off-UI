import 'package:flutter/material.dart';

import '../utils/constants/app_images.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image(
            height: 100,
            width: 110,
            fit: BoxFit.contain,
            image: AssetImage(AppImages.logo),
          ),
        ),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontFamily: 'Inter',
                // fontSize: 15.h,
                color: Colors.white,
              ),
        )
      ],
    );
  }
}
