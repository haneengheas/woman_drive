import 'package:flutter/material.dart';
import 'package:woman_drive/features/driver/driver_profile/widget/edit_profile.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/components/constants.dart';
import 'package:woman_drive/shared/styles/colors.dart';

import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class DriverProfile extends StatefulWidget {
  const DriverProfile({Key? key}) : super(key: key);

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          title:  const Text(
            'الملف الشخصي ',
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            // تعديل صورة البروفايل
            Stack(alignment: Alignment.bottomLeft, children: const [
              CircleAvatar(
                backgroundImage: AssetImage(female),
                radius: 60,
              ),
              CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.pink,
                  child: Icon(
                    Icons.edit,
                    color: AppColors.black,
                    size: 20,
                  )),
            ]),
            // معلومات الحساب
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.pink, width: 2)),
              child: Column(
                textDirection: TextDirection.rtl,
                children: [
                  Header(
                    text: 'الاسم : وجدان',
                    style: AppTextStyles.smTitles,
                  ),
                  Header(
                    text: 'السن : 25',
                    style: AppTextStyles.smTitles,
                  ),
                  Header(
                    text: 'Wijdan@gmail.com : البريد الالكتروني',
                    style: AppTextStyles.smTitles,
                  ),
                  Header(
                    text: 'العنوان : الرياض',
                    style: AppTextStyles.smTitles,
                  ),
                  Header(
                    text: 'رقم الهاتف : 010111111111',
                    style: AppTextStyles.smTitles,
                  ),
                ],
              ),
            ),
            // زر تعديل الملف الشخصي
            CustomButtonTemplate(
              width: width(context, 2),
              color: AppColors.yellow,
              height: 50,
              onPressed: () {
                editProfile(context);
              },
              text: 'تعديل',
              textStyle: AppTextStyles.button,
            ),
            const SizedBox(
              height: 10,
            ),
            // زر تسجيل الخروج
            CustomButtonTemplate(
              width: width(context, 2),
              color: AppColors.pink,
              height: 50,
              onPressed: () {},
              text: 'تسجيل خروج',
              textStyle: AppTextStyles.button,
            ),
          ],
        ),
      ),
    );
  }
}
