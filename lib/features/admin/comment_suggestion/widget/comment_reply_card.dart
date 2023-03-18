import 'package:flutter/material.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';
Future commentReply(
    BuildContext context,
    )
{
  return  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.pinkPowder,
          title: const Center(child: Text('رد')),
          titleTextStyle: AppTextStyles.boldtitles.apply(color: AppColors.black),
          //titlePadding: const EdgeInsets.symmetric(vertical: 20),
          // elevation: 10,
          insetPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                //color: AppColors.pink,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          content: SizedBox(
            width: width(context, 1),
            child: SingleChildScrollView(
              child: TextFieldTemplate(
                hintText: 'رد علي الشكوي',
                icon: null,
                lines: 8,
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: CustomButtonTemplate(
                width: width(context, 3),
                color: AppColors. yellow,
                height: 40,
                onPressed: () {},
                text: 'ارسال',
                textStyle: AppTextStyles.button,
              ),
            ),

          ],
        );
      });

}