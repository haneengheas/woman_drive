// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:woman_drive/features/trainer/home/view.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import 'package:woman_drive/shared/styles/styles.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';

class DrivingInstructorScreen extends StatefulWidget {
  const DrivingInstructorScreen({Key? key}) : super(key: key);

  @override
  State<DrivingInstructorScreen> createState() =>
      _DrivingInstructorScreenState();
}

class _DrivingInstructorScreenState extends State<DrivingInstructorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'انشاء حساب كمدرب قيادة',
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
              )),
        ),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  TextFieldTemplate(
                    hintText: 'اسم المستخدم',
                    icon: Icons.person,
                  ),
                  TextFieldTemplate(
                    hintText: 'البريد الالكتروني',
                    icon: Icons.mail_outlined,
                  ),
                  TextFieldTemplate(
                    hintText: 'كلمة المرور',
                    icon: Icons.lock,
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الهوية',
                    icon: Icons.credit_card,
                  ),
                  TextFieldTemplate(
                    hintText: 'العمر',
                    icon: Icons.mail_outlined,
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الهاتف',
                    icon: Icons.call,
                  ),
                  TextFieldTemplate(
                    hintText: 'العنوان',
                    icon: Icons.home,
                  ),

                  TextFieldTemplate(
                    hintText: 'نوع السيارة',
                    icon: Icons.car_rental,
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم اللوحة',
                    icon: Icons.credit_card_outlined,
                  ),
                  CustomButtonTemplate(
                    height: 50,
                    width: width(context, 1.2),
                    text: 'اضافة صورة الرخصة',
                    color: AppColors.yellow,
                    textStyle: AppTextStyles.brButton,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // زر تسجيل الدخول
                  Center(
                    child: ButtonTemplate(
                      color: AppColors.yellow,
                      onPressed: () =>
                          navigateTo(context, const TrainerHomeScreen()),
                      minwidth: width(context, 2),
                      text1: 'تسجيل ',
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
