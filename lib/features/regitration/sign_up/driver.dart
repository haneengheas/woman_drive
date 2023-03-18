import 'package:flutter/material.dart';
import 'package:woman_drive/shared/components/navigator.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../driver/home/view.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'انشاء حساب كسائق',
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
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                  const SizedBox(
                    height: 15,
                  ),
                  // زر تسجيل الدخول
                  Center(
                    child: ButtonTemplate(
                      color: AppColors.yellow,
                      onPressed: () =>
                          navigateTo(context, const DriverHomeScreen()),
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
