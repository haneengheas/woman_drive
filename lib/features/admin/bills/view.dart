import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:woman_drive/features/admin/bills_details/view.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/components/constants.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import 'package:woman_drive/shared/styles/images.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({Key? key}) : super(key: key);

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الفواتير',
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.pink),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(female),
                          radius: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Header(
                          text: 'ريناد محمد',
                          style: AppTextStyles.name,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RatingBar.builder(
                          textDirection: TextDirection.rtl,
                          initialRating: 4,
                          itemSize: 25,
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
                        Box(
                          color: AppColors.yellow,
                          style: AppTextStyles.name,
                          text: 'الاجمالي : 500 ريال',
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonTemplate(
                      text: 'تم السداد ',
                      height: 40,
                      width: width(context, 3),
                      color: AppColors.darkGreen,
                      onPressed: () {},
                      textStyle: AppTextStyles.brButton,
                    ),
                    CustomButtonTemplate(
                      text: 'عرض التفاصيل',
                      height: 40,
                      width: width(context, 3),
                      color: AppColors.yellow,
                      onPressed: () =>
                          navigateTo(context, const BillsDetailsScreen()),
                      textStyle: AppTextStyles.brButton,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
