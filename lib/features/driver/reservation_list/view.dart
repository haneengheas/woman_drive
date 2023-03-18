import 'package:flutter/material.dart';
import 'package:woman_drive/features/driver/home/view.dart';
import 'package:woman_drive/features/driver/reservation_list/widget/rate_comment_card.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import 'package:woman_drive/shared/styles/colors.dart';
import 'package:woman_drive/shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../../admin/bills_details/reservation_bills_details/view.dart';

class ReservationListScreen extends StatefulWidget {
  const ReservationListScreen({Key? key}) : super(key: key);

  @override
  State<ReservationListScreen> createState() => _ReservationListScreenState();
}

class _ReservationListScreenState extends State<ReservationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'حجوزاتي ',
          ),
          leading: IconButton(
              onPressed: () => navigateTo(context, const DriverHomeScreen()),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
              )),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.black,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  onTap: (){
                    index.isEven? rating(context): navigateTo(context, const ReservationBillDetails());
                  },
                  tileColor: AppColors.darkPink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: Text(
                    'منال',
                    style: AppTextStyles.smTitles,
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(woman1),
                    radius: 35,
                  ),
                  subtitle: const Text('2 November 2023'),
                  trailing:  index.isEven ? Text(
                    'منتهي',
                    style: AppTextStyles.name.apply(color: AppColors.darkRed),
                  ) : Text(
                    'قادم',
                    style: AppTextStyles.name.apply(color: AppColors.darkRed),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
