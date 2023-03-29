import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/admin/bills_details/view.dart';
import 'package:woman_drive/features/admin/cubit/admin_cubit.dart';
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
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminGetBillsSuccessState) {
          if (kDebugMode) {
            print('get bills successfully');
          }
        }
        if (state is AdminGetBillsErrorState) {
          if (kDebugMode) {
            print(state.error);
          }
        }
        if (state is AdminUpdateBillsSuccessState) {
          if (kDebugMode) {
            print('update bills successfully');
          }
        }
        if (state is AdminUpdateBillsErrorState) {
          if (kDebugMode) {
            print(state.error);
          }
        }
      },
      builder: (context, state) {
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
            body: ListView.builder(
                itemCount: AdminCubit.get(context).billsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(female),
                                  radius: 35,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Header(
                                  text:
                                      '${AdminCubit.get(context).billsList[index].name}',
                                  style: AppTextStyles.name,
                                ),
                              ],
                            ),
                            Box(
                              color: AppColors.yellow,
                              style: AppTextStyles.sName,
                              height: 40,
                              dirction: Alignment.center,
                              text: 'اجمالي المبلغ : '
                                  '${AdminCubit.get(context).billsList[index].bills} SR',
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
                              onPressed: () {
                                AdminCubit.get(context).updateBills(
                                    uidTrainer: AdminCubit.get(context)
                                        .billsList[index]
                                        .uid!);
                              },
                              textStyle: AppTextStyles.brButton,
                            ),
                            CustomButtonTemplate(
                              text: 'عرض التفاصيل',
                              height: 40,
                              width: width(context, 3),
                              color: AppColors.yellow,
                              onPressed: () {
                                AdminCubit.get(context).getBillsDetails(
                                    uidTrainer: AdminCubit.get(context)
                                        .billsList[index]
                                        .uid!);
                                navigateTo(context, const BillsDetailsScreen());
                              },
                              textStyle: AppTextStyles.brButton,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }));
      },
    );
  }
}
