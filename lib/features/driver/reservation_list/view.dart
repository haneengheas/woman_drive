// ignore_for_file: avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/driver/cubit/driver_cubit.dart';
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
    return BlocConsumer<DriverCubit, DriverState>(
      listener: (context, state) {
        if (state is DriverGetReservationSuccessState) {
          print('success00000000000');
          print(DriverCubit.get(context).reservationList.length);
          print('00000000000000');
          print(DriverCubit.get(context).reservationList[0].uidDoc);
        }
        if(state is DriverGetReservationErrorState){
          print(state.error);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: DriverCubit.get(context).reservationList.isNotEmpty,
            builder: (context) {
              return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    title: const Text(
                      'حجوزاتي ',
                    ),
                    leading: IconButton(
                        onPressed: () =>
                            navigateTo(context, const DriverHomeScreen()),
                        icon: const Icon(
                          Icons.arrow_back_ios_outlined,
                        )),
                  ),
                  body: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    itemCount: DriverCubit.get(context).reservationList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.black,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            onTap: () {
                              DriverCubit.get(context)
                                          .reservationList[index]
                                          .accepted ==
                                      'منتهي'
                                  ? rating(context, DriverCubit.get(context)
                                  .reservationList[index]
                                  .uidDoc!)
                                  : navigateTo(
                                      context,
                                      ReservationBillDetails(
                                        model: DriverCubit.get(context)
                                            .reservationList[index],
                                      ));
                            },
                            tileColor: AppColors.darkPink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            title: Text(
                              '${DriverCubit.get(context).reservationList[index].trainerName}',
                              style: AppTextStyles.smTitles,
                            ),
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(woman1),
                              radius: 35,
                            ),
                            subtitle: Text(
                                '${DriverCubit.get(context).reservationList[index].dateOfDay}'),
                            trailing: DriverCubit.get(context)
                                        .reservationList[index]
                                        .accepted ==
                                    'منتهي'
                                ? Text(
                                    'منتهي',
                                    style: AppTextStyles.name
                                        .apply(color: AppColors.darkRed),
                                  )
                                : DriverCubit.get(context)
                                            .reservationList[index]
                                            .accepted ==
                                        'قادم'
                                    ? Text(
                                        'قادم',
                                        style: AppTextStyles.name
                                            .apply(color: AppColors.darkRed),
                                      )
                                    : Text(
                                        'قيد المراجعة',
                                        style: AppTextStyles.name
                                            .apply(color: AppColors.darkGreen),
                                      ),
                          ),
                        ),
                      );
                    },
                  ));
            },
            fallback: (context) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: const Text(
                    'حجوزاتي ',
                  ),
                  leading: IconButton(
                      onPressed: () =>
                          navigateTo(context, const DriverHomeScreen()),
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                      )),
                ),
                body: const LinearProgressIndicator(),
              );
            });
      },
    );
  }
}
