import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:woman_drive/features/trainer/trainer_profile/widget/edit_profile.dart';
import 'package:woman_drive/shared/network/local/constant.dart';
import 'package:woman_drive/shared/styles/colors.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../../registration/login/view.dart';
import '../cubit/trainer_cubit.dart';

class TrainerInfoScreen extends StatefulWidget {


  const TrainerInfoScreen({ Key? key}) : super(key: key);

  @override
  State<TrainerInfoScreen> createState() => _TrainerInfoScreenState();
}

class _TrainerInfoScreenState extends State<TrainerInfoScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;

  TextEditingController ageDriverController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrainerCubit, TrainerState>(listener: (context, state) {
      if (state is TrainerSetDataSuccessState) {
        Navigator.pop(context);
      }
      if (state is TrainerUpdateProfileSuccessState) {
        if (kDebugMode) {
          print('edit success');
        }
      }
    }, builder: (context, state) {
      var model = TrainerCubit
          .get(context)
          .model;


      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'الملف الشخصي ',
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
              )),
          actions: [
            IconButton(
                onPressed: () async{
                  uId = '';
                  print(uId);
                  navigateAndReplace(context, const LoginScreen());

            },
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                )),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة الروفايل + الاسم
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          ' ${model!.name}',
                          style: AppTextStyles.name,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'مدرب قيادة',
                          style: AppTextStyles.name,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage(female),
                        radius: 40,
                      ),
                      CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.pink,
                          child: Icon(
                            Icons.edit,
                            color: AppColors.black,
                            size: 20,
                          )),
                    ]),
                  ],
                ),
              ),
              Box(
                height: 40,
                style: AppTextStyles.name,
                text: 'مواصفات السيارة ',
                color: AppColors.pink,
                dirction: Alignment.center,
              ),
              TextFieldTemplate(
                hintText: 'نوع السيارة',
                icon: Icons.car_rental,
                controller: TextEditingController(text: model.carType),
                readOnly: true,
              ),
              TextFieldTemplate(
                hintText: 'رقم اللوحة ',
                icon: Icons.credit_card_outlined,
                controller:
                TextEditingController(text: model.licenseNumber),
                readOnly: true,
              ),
              Box(
                height: 40,
                style: AppTextStyles.name,
                text: ' شروط التدريب',
                color: AppColors.pink,
                dirction: Alignment.center,
              ),
              TextFieldTemplate(
                hintText: 'العمر ',
                icon: Icons.today,
                controller: ageDriverController,
              ),
              TextFieldTemplate(
                hintText: 'السعر ',
                icon: Icons.monetization_on,
                controller: priceController,
              ),
              Box(
                height: 40,
                style: AppTextStyles.name,
                text: 'الاوقات المتاحة',
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
                  onPageChanged: (focusedDay) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // الساعة
              SizedBox(
                // height: 130,
                width: width(context, 1.2),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
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
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonTemplate(
                    width: width(context, 3),
                    color: AppColors.pink,
                    height: 40,
                    onPressed: () {
                      editTrainerProfile(context, model);
                    },
                    text: 'تعديل',
                    textStyle: AppTextStyles.brButton,
                  ),
                  CustomButtonTemplate(
                    width: width(context, 3),
                    color: AppColors.yellow,
                    height: 40,
                    onPressed: () {
                      TrainerCubit.get(context).addTrainerData(
                          ageDriver: ageDriverController.text,
                          price: int.parse(priceController.text));
                      TrainerCubit.get(context).getTrainerData();
                    },
                    text: 'تأكيد',
                    textStyle: AppTextStyles.brButton,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

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
