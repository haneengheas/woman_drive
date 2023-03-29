import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_drive/features/admin/home/view.dart';
import 'package:woman_drive/features/driver/home/view.dart';
import 'package:woman_drive/features/registration/login/cubit/login_cubit.dart';
import 'package:woman_drive/features/registration/reset_password/view.dart';
import 'package:woman_drive/features/registration/sign_up/view.dart';
import 'package:woman_drive/features/trainer/home/view.dart';
import 'package:woman_drive/models/user_model.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/network/local/constant.dart';
import 'package:woman_drive/shared/styles/colors.dart';
import 'package:woman_drive/shared/styles/styles.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/network/local/shared_preferences.dart';
import '../../../shared/styles/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            print(state.error);
            showToast(text: state.error, state: ToastStates.error);
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(
              key: 'uid',
              value: state.uid,
            );
            CacheHelper.saveData(
              key: 'request',
              value: state.request,
            );
            CacheHelper.saveData(key: 'type', value: state.type).then((value) {
              uId = CacheHelper.getData(key: 'uid');
              request = CacheHelper.getData(key: 'request');
              print('Login successfully');
              print(uId);
              if (state.type == 'driver' && state.request == 'accepted') {
                navigateAndReplace(context, const DriverHomeScreen());
              } else if (state.type == 'trainer' &&
                  state.request == 'accepted') {
                navigateAndReplace(context, const TrainerHomeScreen());
              } else if (state.type == 'admin' && state.request == 'accepted') {
                navigateAndReplace(context, const AdminHomeScreen());
              } else {
                showToast(
                    text:
                        'طلبك لا زال قيد المراجعة , بعد الموافقة ستتمكن من اكمال التسجيل',
                    state: ToastStates.error);
              }
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Directionality(
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                        controller: emailController,
                        keyType: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'برجاء كتابه البريد الالكتروني ';
                          } else if (value.length < 5) {
                            return 'برجاء كتابه البريد الالكتروني بشكل صحيح';
                          } else if (!value.toString().contains('@')) {
                            return ' @ يجب ان يحتوي البريد الالكتروني علي  ';
                          }
                        },
                      ),
                      // كلمة المرور
                      TextFieldTemplate(
                          hintText: 'كلمة المرور',
                          icon: Icons.lock,
                          controller: passwordController,
                          keyType: TextInputType.visiblePassword,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال كلمة المرور ';
                            } else if (value.length < 5) {
                              return 'يجب ان تتكون كلمة المرور علي الاقل من ثمانيه خانات';
                            }
                          }),
                      // هل نسيت كلمة المرور
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () =>
                                  navigateTo(context, const ResetPassword()),
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
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
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
                            onTap: () =>
                                navigateTo(context, const SignUpScreen()),
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
            ),
          );
        },
      ),
    );
  }
}
