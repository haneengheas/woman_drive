import 'package:flutter/material.dart';
import 'package:woman_drive/features/regitration/sign_up/driving_instructor%E2%80%99s.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import 'package:woman_drive/shared/styles/colors.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/images.dart';
import 'driver.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                // اللوجو
                Center(
                  child: SizedBox(
                      width: width(context, 2),
                      height: height(context, 3),
                      child: Center(child: Image.asset(logo))),
                ),
                SizedBox(
                  height: height(context, 8),
                ),
                // مدرب القيادة
                ButtonTemplate(
                    minwidth: width(context, 1.7),
                    color: AppColors.yellow,
                    text1: 'تسجيل كمدرب قيادة',
                    onPressed: () =>
                        navigateTo(context, const DrivingInstructorScreen())),
                const SizedBox(
                  height: 10,
                ),
                // سائق
                ButtonTemplate(
                    minwidth: width(context, 1.7),
                    color: AppColors.yellow,
                    text1: 'تسجيل كسائق',
                    onPressed: () => navigateTo(context, const DriverScreen())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
