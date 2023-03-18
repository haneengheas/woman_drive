import 'package:flutter/material.dart';
import 'package:woman_drive/shared/components/constants.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
class ReservationInFoScreen extends StatefulWidget {
  const ReservationInFoScreen({Key? key}) : super(key: key);

  @override
  State<ReservationInFoScreen> createState() => _ReservationInFoScreenState();
}

class _ReservationInFoScreenState extends State<ReservationInFoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'تفاصيل الحجز',

          ),

          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
              )),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // صورة البروفايل + الاسم
              ProfileImage(
                onTap: (){},
                image: female,
                name: 'ريماس محمد',
                role:  'سائق',
              ),
              const SizedBox(
                height: 10,
              ),

              Text(
                'تفاصيل الحجز ',
                style: AppTextStyles.smTitles,
              ),
              const SizedBox(
                height: 15,
              ),

              // المدة
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  const Image(
                    image: AssetImage(clock),
                    height: 25,
                    width: 30,
                  ),
                  Header(
                    text: '  المدة: ساعتان',
                    style: AppTextStyles.w400.apply(
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // الوقت و التاريخ
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  const Image(
                    image: AssetImage(timeTable),
                    height: 20,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '  PM التاريخ : 10/4/2023 - 8:00 ',
                    style: AppTextStyles.w400.apply(
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: AppColors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              // تفاصيل الفاتورة
              Text(
                'تفاصيل الفاتورة ',
                style: AppTextStyles.smTitles,
              ),
              const SizedBox(
                height: 15,
              ),
              // التكلفة
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'التكلفة ',
                    style: AppTextStyles.smTitles,
                  ),
                  Text(
                    'SR 100  ',
                    style: AppTextStyles.smTitles,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // القيمة المضافة
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'القيمة المضافة ',
                    style: AppTextStyles.smTitles,
                  ),
                  Text(
                    'SR 15  ',
                    style: AppTextStyles.smTitles,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // الاجمالي
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الاجمالي ',
                    style: AppTextStyles.smTitles,
                  ),
                  Text(
                    'SR 115  ',
                    style: AppTextStyles.smTitles,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: AppColors.black,
                height: 5,
              ),

              const SizedBox(
                height: 40,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonTemplate(
                    onPressed: (){},
                    textStyle: AppTextStyles.button,
                    color: AppColors.darkGreen,
                    text: 'قبول',
                    width: width(context, 3),
                    height: 40,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomButtonTemplate(
                    onPressed: (){},
                    textStyle: AppTextStyles.button,
                    color: AppColors.darkRed,
                    text: 'رفض',
                    width: width(context, 3),
                    height: 40,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
