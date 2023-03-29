import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/driver/home/view.dart';
import 'package:woman_drive/features/registration/sign_up/driver/cubit/driver_registration_cubit.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/local/constant.dart';
import '../../../../shared/network/local/shared_preferences.dart';
import '../../../../shared/styles/colors.dart';

class DriverRegisterScreen extends StatefulWidget {
  const DriverRegisterScreen({Key? key}) : super(key: key);

  @override
  State<DriverRegisterScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverRegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriverRegistrationCubit(),
      child: BlocConsumer<DriverRegistrationCubit, DriverRegistrationState>(
          listener: (context, state) {
        if (state is DriverRegistrationSuccessState) {
          CacheHelper.saveData(
            key: 'uid',
            value: state.uid,
          );
          uId = CacheHelper.getData(key: 'uid');
          navigateTo(context, const DriverHomeScreen());
        }
        if (state is DriverRegistrationErrorState) {
          showToast(text: state.error, state: ToastStates.error);
        }
      }, builder: (context, state) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldTemplate(
                          hintText: 'اسم المستخدم',
                          icon: Icons.person,
                          keyType: TextInputType.name,
                          controller: nameController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال اسم المستخدم';
                            }
                          },
                        ),
                        TextFieldTemplate(
                          hintText: 'البريد الالكتروني',
                          icon: Icons.mail_outlined,
                          keyType: TextInputType.emailAddress,
                          controller: emailController,
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
                        TextFieldTemplate(
                            hintText: 'كلمة المرور',
                            icon: Icons.lock,
                            keyType: TextInputType.visiblePassword,
                            controller: passwordController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال كلمة المرور ';
                              } else if (value.length < 5) {
                                return 'يجب ان تتكون كلمة المرور علي الاقل من ثمانيه خانات';
                              }
                            }),
                        TextFieldTemplate(
                          hintText: 'العمر',
                          icon: Icons.calendar_month,
                          keyType: TextInputType.number,
                          controller: ageController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال العمر';
                            }
                          },
                        ),
                        TextFieldTemplate(
                          hintText: 'رقم الهاتف',
                          icon: Icons.call,
                          keyType: TextInputType.phone,
                          controller: phoneController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال رقم الهاتف';
                            }
                          },
                        ),
                        TextFieldTemplate(
                          hintText: 'العنوان',
                          icon: Icons.home,
                          keyType: TextInputType.text,
                          controller: addressController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال العنوان';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // زر تسجيل الدخول
                        Center(
                          child: state is DriverRegistrationLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : ButtonTemplate(
                                  color: AppColors.yellow,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      DriverRegistrationCubit.get(context)
                                          .driverRegister(
                                              name: nameController.text,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              age: ageController.text,
                                              phone: phoneController.text,
                                              address: addressController.text);
                                    }
                                    // navigateTo(context, const DriverHomeScreen())
                                  },
                                  minwidth: width(context, 2),
                                  text1: 'تسجيل ',
                                ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      }),
    );
  }
}
