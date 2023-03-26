import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:woman_drive/features/trainer/resservation_info/view.dart';
import 'package:woman_drive/models/trainer_reservation_model.dart';
import 'package:woman_drive/shared/components/constants.dart';
import 'package:woman_drive/shared/components/navigator.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/images.dart';
import '../../../../shared/styles/styles.dart';

class ReservationCard extends StatelessWidget {
  final TrainerReservationModel model;

  const ReservationCard({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            ReservationInFoScreen(
              model: model,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.pink,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            //  الصورة
            const CircleAvatar(
              backgroundImage: AssetImage(woman2),
              backgroundColor: AppColors.pink,
              radius: 25,
            ),
            // الاسم + التاريخ+ التقييم + الايميل
            SizedBox(
              width: width(context, 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${model.driverName}',
                    style: AppTextStyles.name,
                  ),
                  Text(
                    '${model.dateOfDay}',
                    style: AppTextStyles.w400b,
                  ),
                  model.rate == 0
                      ? const SizedBox()
                      : RatingBar.builder(
                          textDirection: TextDirection.rtl,
                          initialRating: model.rate!,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ignoreGestures: true,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.darkGreen,
                  radius: 10,
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                model.accepted == 'منتهي'
                    ? Text(
                        'منتهي',
                        style: AppTextStyles.w400b,
                      )
                    : model.accepted == 'قادم'
                        ? Text(
                            'قادم',
                            style: AppTextStyles.w400b,
                          )
                        : Text(
                            'قيد المراجعة',
                            style: AppTextStyles.w400b,
                          )
              ],
            )
          ],
        ),
      ),
    );
  }
}
