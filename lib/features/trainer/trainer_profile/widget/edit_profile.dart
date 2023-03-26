import 'package:flutter/material.dart';
import 'package:woman_drive/models/trainer_model.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';
import '../../cubit/trainer_cubit.dart';

Future editTrainerProfile(
  BuildContext context,
  TrainerModel model,
) {
  final nameController = TextEditingController(text: model.name);
  final emailController = TextEditingController(text: model.email);
  final idController = TextEditingController(text: model.id);
  final ageController = TextEditingController(text: model.age);
  final phoneController = TextEditingController(text: model.phone);
  final addressController = TextEditingController(text: model.address);
  final carTypeController = TextEditingController(text: model.carType);
  final licenseNumberController =
      TextEditingController(text: model.licenseNumber);

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.pinkPowder,
          title: const Center(child: Text('تعديل الملف الشخصي')),
          titleTextStyle: AppTextStyles.smTitles.apply(color: AppColors.black),
          //titlePadding: const EdgeInsets.symmetric(vertical: 20),
          // elevation: 10,
          insetPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.pink,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          content: SingleChildScrollView(
            child: SizedBox(
              width: width(context, 1),
              child: Column(
                children: [
                  TextFieldTemplate(
                    hintText: 'الاسم',
                    controller: nameController,
                  ),
                  TextFieldTemplate(
                    hintText: 'البريد الالكتروني',
                    controller: emailController,
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الهوية ',
                    controller: idController,
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الهاتف',
                    controller: phoneController,
                  ),
                  TextFieldTemplate(
                    hintText: 'العمر',
                    controller: ageController,
                  ),
                  TextFieldTemplate(
                    hintText: 'العنوان',
                    controller: addressController,
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الرخصة',
                    controller: licenseNumberController,
                  ),
                  TextFieldTemplate(
                    hintText: 'نوع السيارة',
                    controller: carTypeController,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.yellow,
                  height: 40,
                  onPressed: () {
                    TrainerCubit.get(context).updateProfile(
                        name: nameController.text,
                        email: emailController.text,
                        id: idController.text,
                        phone: phoneController.text,
                        age: ageController.text,
                        address: addressController.text,
                        licenseNumber: licenseNumberController.text,
                        carType: carTypeController.text);
                    Navigator.pop(context);
                  },
                  text: 'تأكيد',
                  textStyle: AppTextStyles.brButton,
                ),
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.pink,
                  height: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'الغاء',
                  textStyle: AppTextStyles.brButton,
                ),
              ],
            ),
          ],
        );
      });
}
