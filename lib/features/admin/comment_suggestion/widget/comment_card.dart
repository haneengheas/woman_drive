import 'package:flutter/material.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';
class CommentCard extends StatelessWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width(context, 1.3),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.brown,width: 1),
        color: AppColors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Box(
            text: 'المرسل : مني    تاريخ : 20/11/2022',
            color: AppColors.pinkPowder2,
            style: AppTextStyles.name,
          ),
          Box(
            text: 'العنوان : تعليق',
            color: AppColors.pinkPowder2,
            style: AppTextStyles.name,
          ),
          Box(
            text: 'التعليقات او الشكاوي ',
            color: AppColors.pinkPowder2,
            style: AppTextStyles.name,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomButtonTemplate(
              text: 'رد',
              width: 70,
              height: 30,
              color: AppColors.yellow,
              textStyle: AppTextStyles.button,
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
