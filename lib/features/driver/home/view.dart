import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/driver/cubit/driver_cubit.dart';
import 'package:woman_drive/features/driver/reservation_list/view.dart';
import 'package:woman_drive/features/driver/suggestion_comment/view.dart';
import 'package:woman_drive/shared/styles/colors.dart';
import 'package:woman_drive/shared/styles/images.dart';
import 'package:woman_drive/shared/styles/styles.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/network/local/constant.dart';
import '../driver_profile/view.dart';
import '../suggestion_comment/new_comment_screen.dart';
import '../trainers_list/view.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverState>(listener: (context, state) {
      if (state is DriverGetDataSuccessState) {
        if (kDebugMode) {
          print('hello');
          print(uId);
        }
      }
      if (state is DriverGetDataErrorState) {
        if (kDebugMode) {
          print(state.error.toString());
        }
      }
    }, builder: (context, state) {
      var model = DriverCubit
          .get(context)
          .model;
      return ConditionalBuilder(
          condition: state is! DriverGetDataLoadingState,
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      // الصورة الشخصية + الاسم
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(
                                  '${model!.name}' ' مرحبا بك ',
                                  style: AppTextStyles.name,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'سائق',
                                  style: AppTextStyles.name,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () =>
                                  navigateTo(context, const DriverProfile()),
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(female),
                                radius: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: AppColors.black,
                        height: 5,
                      ),
                      SizedBox(
                        height: height(context, 5),
                      ),
                      ButtonTemplate(
                        color: AppColors.pink,
                        onPressed: () =>
                            navigateTo(context, const TrainerListScreen()),
                        minwidth: width(context, 1.7),
                        text1: 'اختر مدربك ',
                      ),
                      ButtonTemplate(
                        color: AppColors.yellow,
                        onPressed: () {
                          navigateTo(context, const ReservationListScreen());
                        },
                        minwidth: width(context, 1.7),
                        text1: 'الحجوزات  ',
                      ),
                      ButtonTemplate(
                        color: AppColors.pink,
                        onPressed: () =>
                            navigateTo(context, const DriverCommentScreen()),
                        minwidth: width(context, 1.7),
                        text1: 'شكاوي او مقترحات  ',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          fallback: (context) {
            return const Scaffold(
              body: LinearProgressIndicator(),
            );
          });
    });
  }
}
