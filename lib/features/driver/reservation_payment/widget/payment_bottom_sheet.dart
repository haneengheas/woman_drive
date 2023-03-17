import 'package:flutter/material.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

Future  showBottomSheet ( BuildContext context )
{
  return   showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Text(
                      'اتمام عملية الدفع ',
                      style: AppTextStyles.boldtitles,
                    )),
                // رقم البطاقة الائتمانية
                TextFieldTemplate(
                  hintText: 'رقم البطاقة الائتمانية',
                  icon: Icons.credit_card_outlined,
                ),
                // الباسورد + تاريخ الانتهاء
                Row(
                  children: [
                    SizedBox(
                      width: width(context, 2.2),
                      height: 100,
                      //margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFieldTemplate(
                        hintText: 'تاريخ الانتهاء',
                        icon: Icons.date_range,
                      ),
                    ),
                    SizedBox(
                      width: width(context, 2.2),
                      height: 100,
                      //margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFieldTemplate(
                        hintText: 'الرقم السري',
                        icon: Icons.lock,
                      ),
                    ),
                  ],
                ),
                TextFieldTemplate(
                  hintText: 'الاسم علي البطاقة',
                  icon: Icons.person,
                ),
                CustomButtonTemplate(
                  height: 40,
                  width: width(context, 3),
                  color: AppColors.yellow,
                  text: 'اتمام العملية',
                  onPressed: () => Navigator.pop(context),
                  textStyle: AppTextStyles.button,
                )
              ],
            ),
          ),
        );
      });
}