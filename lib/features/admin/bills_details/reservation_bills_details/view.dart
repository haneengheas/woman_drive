import 'package:flutter/material.dart';
import 'package:woman_drive/models/driver_reservation_model.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/images.dart';
import '../../../../shared/styles/styles.dart';

class ReservationBillDetails extends StatefulWidget {
  final DriverReservationModel? model;

   const ReservationBillDetails({required this.model, Key? key})
      : super(key: key);

  @override
  State<ReservationBillDetails> createState() => _ReservationBillDetailsState();
}

class _ReservationBillDetailsState extends State<ReservationBillDetails> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // صورة البروفايل + الاسم
                ProfileImage(
                  onTap: () {},
                  image: female,
                  name: widget.model!.trainerName,
                  role: 'سائق',
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
                      text: 'المدة : ' '${widget.model!.numHours}' ' ساعة ',
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
                      '${widget.model!.dayDate}'
                          '  '
                          '${widget.model!.hours}'
                          ' : التاريخ  ',
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
                  thickness: 1,
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
                      '${widget.model!.total}' ' SR ',
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
                      '${(widget.model!.total! + 15)} SR',
                      style: AppTextStyles.smTitles,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
