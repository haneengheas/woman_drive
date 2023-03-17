import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:woman_drive/features/admin/bills_details/reservation_bills_details/view.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
class BillsDetailsScreen extends StatefulWidget {
  const BillsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BillsDetailsScreen> createState() => _BillsDetailsScreenState();
}

class _BillsDetailsScreenState extends State<BillsDetailsScreen> {
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
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => navigateTo(context, const ReservationBillDetails()),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ريماس محمد',
                        style: AppTextStyles.sName,
                      ),
                      // Text(
                      //   '20 October 2023',
                      //   style: AppTextStyles.w400s,
                      // ),
                      RatingBar.builder(
                        textDirection: TextDirection.rtl,
                        initialRating: 3,
                        itemSize: 20,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColors.darkGreen,
                        radius: 12.5,
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '300 SR',
                        style: AppTextStyles.name,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
