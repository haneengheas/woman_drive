import 'package:flutter/material.dart';
import 'package:woman_drive/features/driver/cubit/driver_cubit.dart';
import 'package:woman_drive/models/driver_model.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

Future editProfile({
  required DriverModel model,
  required BuildContext context,
}) {
  final nameController = TextEditingController(text: model.name);
  final emailController = TextEditingController(text: model.email);
  final ageController = TextEditingController(text: model.age);
  final phoneController = TextEditingController(text: model.phone);
  final addressController = TextEditingController(text: model.address);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.pinkPowder,
          title: const Center(child: Text('تعديل الملف الشخصي')),
          titleTextStyle: AppTextStyles.smTitles.apply(color: AppColors.black),
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
                    icon: Icons.person,
                    controller: nameController,
                  ),
                  TextFieldTemplate(
                    hintText: 'البريد الالكتروني',
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الهاتف',
                    icon: Icons.phone,
                    controller: phoneController,
                  ),
                  TextFieldTemplate(
                    hintText: 'العمر',
                    icon: Icons.calendar_month,
                    controller: ageController,
                  ),
                  TextFieldTemplate(
                    hintText: 'العنوان',
                    icon: Icons.home,
                    controller: addressController,
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
                    DriverCubit.get(context).updateDriverDate(
                        name: nameController.text,
                        email: emailController.text,
                        age: ageController.text,
                        phone: phoneController.text,
                        address: addressController.text);
                    Navigator.pop(context);
                  },
                  text: 'تأكيد',
                  textStyle: AppTextStyles.button,
                ),
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.pink,
                  height: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'الغاء',
                  textStyle: AppTextStyles.button,
                ),
              ],
            ),
          ],
        );
      });
}
