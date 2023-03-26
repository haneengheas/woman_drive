// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/driver/cubit/driver_cubit.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/components/navigator.dart';

import '../../../models/trainer_model.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/constant.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../reservation_list/view.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class ReservationPaymentScreen extends StatefulWidget {
  String? selectedDay;
  String? hour;
  int? numHours;
  TrainerModel model;
  int? total;

  ReservationPaymentScreen(
      {required this.selectedDay,
      required this.hour,
      required this.numHours,
      required this.model,
      required this.total,
      Key? key})
      : super(key: key);

  @override
  State<ReservationPaymentScreen> createState() =>
      _ReservationPaymentScreenState();
}

class _ReservationPaymentScreenState extends State<ReservationPaymentScreen> {
  bool fill = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverState>(listener: (context, state) {
      if (state is DriverMakeReservationSuccessState) {
        print('success');
      }
    }, builder: (context, state) {
      var driverModel = DriverCubit.get(context).model;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'حجز موعد ',
            ),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                )),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // صورة البروفايل + الاسم
                  ProfileImage(
                    onTap: () {},
                    image: female,
                    role: 'مدرب قيادة',
                    name: widget.model.name,
                  ),
                  const SizedBox(
                    height: 20,
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
                    textDirection: ui.TextDirection.rtl,
                    children: [
                      const Image(
                        image: AssetImage(clock),
                        height: 25,
                        width: 30,
                      ),
                      Header(
                        text: 'المدة : ' '${widget.numHours}' ' ساعة ',
                        style: AppTextStyles.w400.apply(
                          color: AppColors.greyDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // الوقت و التاريخ
                  Row(
                    textDirection: ui.TextDirection.rtl,
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
                        '${widget.selectedDay}'
                        '  '
                        '${widget.hour}'
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
                    textDirection: ui.TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'التكلفة ',
                        style: AppTextStyles.smTitles,
                      ),
                      Text(
                        '${widget.total}' ' SR ',
                        style: AppTextStyles.smTitles,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // القيمة المضافة
                  Row(
                    textDirection: ui.TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'القيمة المضافة ',
                        style: AppTextStyles.smTitles,
                      ),
                      Text(
                        ' 15 SR ',
                        style: AppTextStyles.smTitles,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // الاجمالي
                  Row(
                    textDirection: ui.TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الاجمالي ',
                        style: AppTextStyles.smTitles,
                      ),
                      Text(
                        '${(widget.total! + 15)} SR',
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
                    height: 35,
                  ),

                  Center(
                    child: fill == false
                        ? ButtonTemplate(
                            color: AppColors.yellow,
                            text1: 'اتمام عملية الدفع ',
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: AppColors.pinkPowder,
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
                                              hintText:
                                                  'رقم البطاقة الائتمانية',
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
                                              onPressed: () {
                                                String? dateOfToday;
                                                var now = DateTime.now();
                                                var formatter =
                                                    DateFormat('yyyy-MM-dd');
                                                dateOfToday =
                                                    formatter.format(now);
                                                print(dateOfToday);
                                                DriverCubit.get(context)
                                                    .reservationRequest(
                                                  hours: widget.hour!,
                                                  numHours: widget.numHours!,
                                                  dayDate: widget.selectedDay!,
                                                  total: widget.total!,
                                                  uidTrainer: widget.model.uid!,
                                                  uidDriver: uId!,
                                                  dateOfDay: dateOfToday,
                                                  driverName:
                                                      driverModel!.name!,
                                                  trainerName:
                                                      widget.model.name!,
                                                );
                                                setState(() {
                                                  fill = true;
                                                });
                                                Navigator.pop(context);
                                              },
                                              textStyle: AppTextStyles.brButton,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            })
                        : ButtonTemplate(
                            color: AppColors.yellow,
                            text1: 'عرض الحجز',
                            onPressed: () {
                              navigateTo(
                                  context, const ReservationListScreen());
                            }),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
