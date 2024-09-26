import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick/features/authentication/controllers/vendor/signup_controller/signup_controller.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/bg_image.dart';
import '../../../../../common/login_header.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<SignupController>(SignupController());

    return Stack(
      children: [
        /// bg image
        BgImage(),

        /// Scaffold
        Scaffold(
          backgroundColor: AppColors.primary.withOpacity(0.5),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 1. Logo, Title & SubTitle
                  const SizedBox(height: 54),
                  const LoginHeader(title: 'Sign up'),
                  const SizedBox(height: 30),

                  /// 2. Form...
                  const SignupForm(),
                  const SizedBox(height: 30),

                  /// 
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
