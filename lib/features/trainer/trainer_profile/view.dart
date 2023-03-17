import 'package:flutter/material.dart';
import 'package:woman_drive/features/trainer/trainer_profile/widget/edit_profile.dart';
import 'package:woman_drive/shared/styles/colors.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class TrainerInfoScreen extends StatefulWidget {
  const TrainerInfoScreen({Key? key}) : super(key: key);

  @override
  State<TrainerInfoScreen> createState() => _TrainerInfoScreenState();
}

class _TrainerInfoScreenState extends State<TrainerInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'الملف الشخصي ',
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // صورة الروفايل + الاسم
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        ' ريناد محمد ',
                        style: AppTextStyles.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'مدرب قيادة',
                        style: AppTextStyles.name,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(alignment: Alignment.bottomLeft, children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage(female),
                      radius: 40,
                    ),
                    CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.pink,
                        child: Icon(
                          Icons.edit,
                          color: AppColors.black,
                          size: 20,
                        )),
                  ]),
                ],
              ),
            ),
            Box(
              height: 40,
              style: AppTextStyles.name,
              text: 'مواصفات السيارة ',
              color: AppColors.pink,
              dirction: Alignment.center,
            ),
            TextFieldTemplate(
              hintText: 'نوع السيارة ',
              icon: Icons.car_rental,
            ),
            TextFieldTemplate(
              hintText: 'رقم اللوحة ',
              icon: Icons.credit_card_outlined,
            ),
            Box(
              height: 40,
              style: AppTextStyles.name,
              text: ' شروط التدريب',
              color: AppColors.pink,
              dirction: Alignment.center,
            ),
            TextFieldTemplate(
              hintText: 'العمر ',
              icon: Icons.today,
            ),
            TextFieldTemplate(
              hintText: 'السعر ',
              icon: Icons.monetization_on,
            ),
            Box(
              height: 40,
              style: AppTextStyles.name,
              text: 'الاوقات المتاحة',
              color: AppColors.pink,
              dirction: Alignment.center,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.pink,
                  height: 40,
                  onPressed: () {
                    editTrainerProfile(context);
                  },
                  text: 'تعديل',
                  textStyle: AppTextStyles.brButton,
                ),
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.yellow,
                  height: 40,
                  onPressed: () {},
                  text: 'تأكيد',
                  textStyle: AppTextStyles.brButton,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
