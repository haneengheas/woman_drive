// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/registration/insructions/view.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import 'package:woman_drive/shared/styles/styles.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import 'cubit/trainer_register_cubit.dart';

class TrainerRegisterScreen extends StatefulWidget {
  const TrainerRegisterScreen({Key? key}) : super(key: key);

  @override
  State<TrainerRegisterScreen> createState() => _TrainerRegisterScreenState();
}

class _TrainerRegisterScreenState extends State<TrainerRegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final idController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final carTypeController = TextEditingController();
  final licenseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrainerRegisterCubit(),
        child: BlocConsumer<TrainerRegisterCubit, TrainerRegisterState>(
          listener: (context, state) {
            if (state is TrainerRegisterSuccessState) {
              navigateTo(context, const InstructionsScreen());
            }
            if (state is TrainerRegisterErrorState) {
              print('hhhhhhhhhh');
              showToast(text: state.error.toString(), state: ToastStates.error);
            }
            if (state is TrainerGetImageErrorState) {
              showToast(text: state.error, state: ToastStates.error);
            }
          },
          builder: (context, state) {
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Form(
                        key: formKey,
                        child: Column(children: [
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
                            hintText: 'رقم الهوية',
                            icon: Icons.credit_card,
                            keyType: TextInputType.number,
                            controller: idController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال رقم الهوية';
                              } else if (value.length < 11) {
                                return 'يحب ان يتكون رقم الهوية علي الاقل من 11 رقم';
                              }
                            },
                          ),
                          TextFieldTemplate(
                            hintText: 'العمر',
                            icon: Icons.mail_outlined,
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

                          TextFieldTemplate(
                            hintText: 'نوع السيارة',
                            icon: Icons.car_rental,
                            keyType: TextInputType.text,
                            controller: carTypeController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال نوع السيارة';
                              }
                            },
                          ),
                          TextFieldTemplate(
                            hintText: 'رقم اللوحة',
                            icon: Icons.credit_card_outlined,
                            keyType: TextInputType.number,
                            controller: licenseNumberController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'برجاء ادخال رقم اللوحة';
                              }
                            },
                          ),
                          state is TrainerUploadImageLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButtonTemplate(
                                  height: 50,
                                  width: width(context, 1.2),
                                  text: 'اضافة صورة الرخصة',
                                  color: AppColors.yellow,
                                  textStyle: AppTextStyles.brButton,
                                  onPressed: () {
                                    TrainerRegisterCubit.get(context)
                                        .getLicenseImage();
                                  },
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          // زر تسجيل الدخول
                          Center(
                            child: state is TrainerRegisterLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ButtonTemplate(
                                    color: AppColors.yellow,
                                    onPressed: () {
                                      if (TrainerRegisterCubit.get(context)
                                              .licenseImageFile ==
                                          null) {
                                        showToast(
                                            text: 'يجب اضافة صورة الرخصة',
                                            state: ToastStates.error);
                                      } else {
                                        if (formKey.currentState!.validate()) {
                                          TrainerRegisterCubit.get(context)
                                              .trainerRegister(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  id: idController.text,
                                                  age: ageController.text,
                                                  phone: phoneController.text,
                                                  address:
                                                      addressController.text,
                                                  carType:
                                                      carTypeController.text,
                                                  licenseNumber:
                                                      licenseNumberController
                                                          .text);
                                        }
                                      }
                                    },
                                    minwidth: width(context, 2),
                                    text1: 'تسجيل ',
                                  ),
                          )
                        ]),
                      ),
                    )),
              ),
            );
          },
        ));
  }
}
