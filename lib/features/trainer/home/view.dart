
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../reservation/view.dart';
import '../trainer_profile/view.dart';

class TrainerHomeScreen extends StatefulWidget {
  const TrainerHomeScreen({Key? key}) : super(key: key);

  @override
  State<TrainerHomeScreen> createState() => _TrainerHomeScreenState();
}

class _TrainerHomeScreenState extends State<TrainerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // الصورة الشخصية + الاسم
              ProfileImage(
                onTap: null,
                image: female,
                role: 'مدرب قيادة',
                name: ' مرحبا بك , ريناد محمد ',
              ),
              const Divider(
                color: AppColors.black,
                height: 5,
              ),
              SizedBox(
                height: height(context, 5),
              ),
              ButtonTemplate(
                color: AppColors.yellow,
                onPressed: () =>
                    navigateTo(context, const TrainerReservationScreen()),
                minwidth: width(context, 1.7),
                text1: 'الحجوزات  ',
              ),
              ButtonTemplate(
                color: AppColors.pink,
                onPressed: () => navigateTo(context, const TrainerInfoScreen()),
                minwidth: width(context, 1.7),
                text1: 'حسابي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
