import 'package:flutter/material.dart';
import 'package:woman_drive/features/trainer/reservation/widget/reservation_card.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/components/constants.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';

class TrainerReservationScreen extends StatefulWidget {
  const TrainerReservationScreen({Key? key}) : super(key: key);

  @override
  State<TrainerReservationScreen> createState() =>
      _TrainerReservationScreenState();
}

class _TrainerReservationScreenState extends State<TrainerReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الحجوزات ',
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // عدد المقبولين و الانتهاء
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Header(
                      text: 'تم الانتهاء',
                      style: AppTextStyles.smTitles,
                    ),
                    Box(
                      color: AppColors.yellow,
                      width: 80,
                      height: 40,
                      text: '3',
                      style: AppTextStyles.smTitles,
                      dirction: Alignment.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Header(
                      text: 'تم قبول',
                      style: AppTextStyles.smTitles,
                    ),
                    Box(
                      color: AppColors.pink,
                      width: 80,
                      height: 40,
                      text: '3',
                      style: AppTextStyles.smTitles,
                      dirction: Alignment.center,
                    )
                  ],
                ),
              ],
            ),
            const Divider(
              color: AppColors.black,
              thickness: .5,
            ),
            SizedBox(
              height: height(context, 1.2),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ReservationCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
