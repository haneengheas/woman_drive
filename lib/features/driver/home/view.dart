import 'package:flutter/material.dart';
import 'package:woman_drive/features/driver/reservation_list/view.dart';
import 'package:woman_drive/features/driver/suggestion_comment/view.dart';
import 'package:woman_drive/shared/styles/colors.dart';
import 'package:woman_drive/shared/styles/images.dart';
import 'package:woman_drive/shared/styles/styles.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../driver_profile/view.dart';
import '../trainers_list/view.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // الصورة الشخصية + الاسم
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          ' مرحبا بك , ويجدان',
                          style: AppTextStyles.name,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'سائق',
                          style: AppTextStyles.name,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () => navigateTo(context, const DriverProfile()),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(female),
                        radius: 40,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.black,
                height: 5,
              ),
              SizedBox(
                height: height(context, 5),
              ),
              ButtonTemplate(
                color: AppColors.pink,
                onPressed: () => navigateTo(context, const TrainerListScreen()),
                minwidth: width(context, 1.7),
                text1: 'اختر مدربك ',

              ),
              ButtonTemplate(
                color: AppColors.yellow,
                onPressed: () =>
                    navigateTo(context, const ReservationListScreen()),
                minwidth: width(context, 1.7),
                text1: 'الحجوزات  ',
              ),
              ButtonTemplate(
                color: AppColors.pink,
                onPressed: () => navigateTo(context, const CommentScreen()),
                minwidth: width(context, 1.7),
                text1: 'شكاوي او مقترحات  ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
