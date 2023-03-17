import 'package:flutter/material.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';
Future editProfile(
    BuildContext context,
      )
{
  return  showDialog(
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
              height: height(context, 1.2),
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
                    hintText: 'رقم الهاتف',
                  ),
                  TextFieldTemplate(
                    hintText: 'العمر',
                  ),
                  TextFieldTemplate(
                    hintText: 'العنوان',
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
                  color: AppColors. yellow,
                  height: 40,
                  onPressed: () {},
                  text: 'تأكيد',
                  textStyle: AppTextStyles.button,
                ),
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.pink,
                  height: 40,
                  onPressed: () {},
                  text: 'الغاء',
                  textStyle: AppTextStyles.button,
                ),
              ],
            ),

          ],
        );
      });

}