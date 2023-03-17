import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';
Future rating(
    BuildContext context,
    )
{
  return  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.pinkPowder,
          title: const Center(child: Text('تقييم')),
          titleTextStyle: AppTextStyles.smTitles.apply(color: AppColors.black),
          //titlePadding: const EdgeInsets.symmetric(vertical: 20),
          // elevation: 10,
          //insetPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                //color: AppColors.pink,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          content: SizedBox(
            width: width(context, 1),
            child: SingleChildScrollView(


              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: RatingBar.builder(
                          textDirection: TextDirection.rtl,
                          initialRating: 0,
                          minRating: 1,
                          itemSize: 40,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                          },
                        ),
                      ),
                    ],
                  ),

                  TextFieldTemplate(
                    hintText: 'شاركنا برايك في المدرب',
                    icon: null,
                    lines: 6,
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
                  text: 'ارسال',
                  textStyle: AppTextStyles.button,
                ),

              ],
            ),

          ],
        );
      });

}