import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
class NewTrainerInfoScreen extends StatefulWidget {
  const NewTrainerInfoScreen({Key? key}) : super(key: key);

  @override
  State<NewTrainerInfoScreen> createState() => _NewTrainerInfoScreenState();
}

class _NewTrainerInfoScreenState extends State<NewTrainerInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'طلب اللتحاق',
        ),

        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_outlined,

            )),
      ),
      body: SingleChildScrollView(
       // padding: const EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 10,),
            // معلومات الحساب
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric( vertical: 10),
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
                    text: 'العمر : 25',
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
                  Header(
                    text: 'رقم الهوية : 010111111111',
                    style: AppTextStyles.smTitles,
                  ),
                  Header(
                    text: 'رقم الرخصة : 010111111111',
                    style: AppTextStyles.smTitles,
                  ),
                  Header(
                    text: 'نوع السيارة : كيا سبورتاج',
                    style: AppTextStyles.smTitles,
                  ),
                  Header(
                    text: 'رقم اللوحة : 010111111111',
                    style: AppTextStyles.smTitles,
                  ),
                  Header(
                    text: 'صورة الرخصة : صورة',
                    style: AppTextStyles.smTitles,
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // زر قبول الطلب
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.darkGreen,
                  height: 45,
                  onPressed: () {},
                  text: 'قبول',
                  textStyle: AppTextStyles.brButton,
                ),

                // زر رفض الطلب
                CustomButtonTemplate(
                  width: width(context, 3),
                  color: AppColors.darkRed,
                  height: 40,
                  onPressed: () {},
                  text: 'رفض',
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
