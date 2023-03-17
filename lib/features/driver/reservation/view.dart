import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:woman_drive/features/driver/reservation_payment/view.dart';
import 'package:woman_drive/shared/components/constants.dart';
import 'package:woman_drive/shared/components/navigator.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              const SizedBox(height: 10,),
              // كم عدد الساعات
              Box(
                height: 40,
                style: AppTextStyles.name,
                text: 'كم عدد الساعات تحتاجها علي مدار الاسبوع؟  ',
                color: AppColors.pink,
                dirction: Alignment.center,
              ),
              // عدد الساعات
              SizedBox(
                width: width(context, 1.1),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 3,crossAxisSpacing:10,mainAxisSpacing: 10 ),
                  itemCount: hours.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        for (int i = 0; i < hours.length; i++) {
                          if (hours[i]['isSelected'] == true) {
                            setState(() {
                              hours[i]['isSelected'] = false;
                            });
                          }
                          setState(() {
                            hours[index]['isSelected'] = true;
                          });
                        }
                      },
                      child: Container(
                        height: 10,
                        width: width(context, 5),
                        alignment: Alignment.center,
                         margin: const EdgeInsets.symmetric(
                            horizontal: 10,),
                        decoration: BoxDecoration(
                            color: hours[index]['isSelected']
                                ? AppColors.pink
                                : Colors.white,
                            border: Border.all(color: AppColors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(hours[index]['clock'],
                            style: AppTextStyles.smTitles),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10,),
              // ما اليوم و الساعة
              Box(
                height: 40,
                style: AppTextStyles.name,
                text:  'كم عدد الساعات تحتاجها علي مدار الاسبوع؟  ',
                color: AppColors.pink,
                dirction: Alignment.center,
              ),
              // التقويم
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                child: TableCalendar(

                  rowHeight: 30,
                  calendarStyle: CalendarStyle(
                      defaultTextStyle: AppTextStyles.smTitles,
                      weekNumberTextStyle: AppTextStyles.smTitles,
                      selectedDecoration: const BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      )),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
//
                      // update `_focusedDay` here as well
                    });
                  },
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                  },
                ),
              ),
              const SizedBox(height: 10,),

              // الساعة
              SizedBox(
               // height: 130,
                width: width(context, 1.2),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 3 ,crossAxisSpacing:10,mainAxisSpacing: 10 ),
                  itemCount: clock.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        for (int i = 0; i < clock.length; i++) {
                          if (clock[i]['isSelected'] == true) {
                            setState(() {
                              clock[i]['isSelected'] = false;
                            });
                          }
                          setState(() {
                            clock[index]['isSelected'] = true;
                          });
                        }
                      },

                      child: Container(
                        //height: 20,
                        //width: width(context, 3.5),
                        alignment: Alignment.center,
                        // margin: const EdgeInsets.symmetric(
                        //     horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: clock[index]['isSelected']
                                ? AppColors.pink
                                : Colors.white,
                            border: Border.all(color: AppColors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(clock[index]['clock'],
                            style: AppTextStyles.smTitles),
                      ),
                    );
                  },
                ),
              ),
              CustomButtonTemplate(
                color: AppColors.yellow,
                height: 35,
                width: width(context, 3),
                onPressed: () =>
                    navigateTo(context, const ReservationPaymentScreen()),
                text: 'التالي',
                textStyle: AppTextStyles.brButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> hours = [
  {
    'clock': '2',
    'isSelected': false,
  },
  {
    'clock': '3',
    'isSelected': false,
  },
  {
    'clock': '4',
    'isSelected': false,
  },
  {
    'clock': '5',
    'isSelected': false,
  },
  {
    'clock': '6',
    'isSelected': false,
  },
  {
    'clock': '7',
    'isSelected': false,
  },
];
List<Map<String, dynamic>> clock = [
  {
    'clock': '9:00 Am',
    'isSelected': false,
  },
  {
    'clock': '12:00 Pm',
    'isSelected': false,
  },
  {
    'clock': '3:00 Pm',
    'isSelected': false,
  },
  {
    'clock': '6:00 Pm ',
    'isSelected': false,
  },
  {
    'clock': '8:00 Pm',
    'isSelected': false,
  },
  {
    'clock': '8:30 Pm',
    'isSelected': false,
  },
];
