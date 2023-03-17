import 'package:flutter/material.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

Future editTrainerProfile(
  BuildContext context,
) {
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
                  ),
                  TextFieldTemplate(
                    hintText: 'البريد الالكتروني',
                  ),
                  TextFieldTemplate(
                    hintText: 'كلمة المرور',
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الهوية ',
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الهاتف',
                  ),
                  TextFieldTemplate(
                    hintText: 'العمر',
                  ),
                  TextFieldTemplate(
                    hintText: 'العنوان',
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم الرخصة',
                  ),
                  TextFieldTemplate(
                    hintText: 'نوع السيارة',
                  ),
                  TextFieldTemplate(
                    hintText: 'رقم اللوحة',
                  ),
                  TextFieldTemplate(
                    hintText: 'عمر المتدربين',
                  ),
                  TextFieldTemplate(
                    hintText: 'السعر',
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
                  onPressed: () {},
                  text: 'تأكيد',
                  textStyle: AppTextStyles.brButton,
                ),
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.pink,
                  height: 40,
                  onPressed: () {},
                  text: 'الغاء',
                  textStyle: AppTextStyles.brButton,
                ),
              ],
            ),
          ],
        );
      });
}
