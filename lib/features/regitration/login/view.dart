import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_drive/features/admin/home/view.dart';
import 'package:woman_drive/features/regitration/reset_password/view.dart';
import 'package:woman_drive/features/regitration/sign_up/view.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/styles/colors.dart';
import 'package:woman_drive/shared/styles/styles.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              // اللوجو
              Center(
                child: SizedBox(
                    width: width(context, 2),
                    height: height(context, 3),
                    child: Center(child: Image.asset(logo))),
              ),
               Header(
                text: 'تسجيل دخول',
                style: AppTextStyles.boldtitles,

              ),
              // البريد الالكتروني
              TextFieldTemplate(
                hintText: 'البريد الالكتروني',
                icon: Icons.mail_outlined,
              ),
              // كلمة المرور
              TextFieldTemplate(
                hintText: 'كلمة المرور',
                icon: Icons.lock,
              ),
              // هل نسيت كلمة المرور
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => navigateTo(context, const ResetPassword()),
                      child: Text("هل نسيت كلمه المرور؟",
                          style: GoogleFonts.tajawal(
                            fontSize: 16,
                            color: AppColors.black,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // زر تسجيل الدخول
              Center(
                child: ButtonTemplate(
                  color: AppColors.yellow,
                  onPressed: () => navigateTo(context, const AdminHomeScreen()),
                  minwidth: width(context, 5),
                  text1: 'تسجيل الدخول',
                ),
              ),
          const SizedBox(
            height: 50,
          ),
              // انشاء حساب تسجيل دخول جديد
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => navigateTo(context, const SignUpScreen()),
                    child: Text(
                      "إنشاء حساب  ",
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: AppColors.pink,
                      ),
                    ),
                  ),
                   Text(" ليس لديك حساب؟  ",
                      style: AppTextStyles.smTitles),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
