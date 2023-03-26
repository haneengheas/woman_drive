import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/trainer/cubit/trainer_cubit.dart';
import 'package:woman_drive/shared/network/local/constant.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../reservation/view.dart';
import '../trainer_profile/view.dart';

class TrainerHomeScreen extends StatefulWidget {
  const TrainerHomeScreen({Key? key}) : super(key: key);

  @override
  State<TrainerHomeScreen> createState() => _TrainerHomeScreenState();
}

class _TrainerHomeScreenState extends State<TrainerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrainerCubit, TrainerState>(listener: (context, state) {
      if (state is TrainerGetDataSuccessState) {
        if (kDebugMode) {
          print('hello');
          print(uId);
        }

      }
      if (state is TrainerGetDataErrorState) {
        if (kDebugMode) {
          print(state.error.toString());
        }
      }
    }, builder: (context, state) {
      var model = TrainerCubit.get(context).model;
      return ConditionalBuilder(
          condition: state is! TrainerGetDataLoadingState,
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // الصورة الشخصية + الاسم
                      ProfileImage(
                        onTap: null,
                        image: female,
                        role: 'مدرب قيادة',
                        name: '${model!.name}' ' مرحبا بك ',
                      ),
                      const Divider(
                        color: AppColors.black,
                        height: 5,
                      ),
                      SizedBox(
                        height: height(context, 5),
                      ),
                      ButtonTemplate(
                        color: AppColors.yellow,
                        onPressed: ()  {
                          TrainerCubit.get(context).getReservation();
                          navigateTo(context, const TrainerReservationScreen());
                        },
                        minwidth: width(context, 1.7),
                        text1: 'الحجوزات  ',
                      ),
                      ButtonTemplate(
                        color: AppColors.pink,
                        onPressed: () => navigateTo(
                            context,
                            const TrainerInfoScreen(
                            )),
                        minwidth: width(context, 1.7),
                        text1: 'حسابي',
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
