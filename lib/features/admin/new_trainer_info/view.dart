// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woman_drive/features/admin/cubit/admin_cubit.dart';
import 'package:woman_drive/models/trainer_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';

class NewTrainerInfoScreen extends StatefulWidget {
  TrainerModel model;

  NewTrainerInfoScreen({required this.model, Key? key}) : super(key: key);

  @override
  State<NewTrainerInfoScreen> createState() => _NewTrainerInfoScreenState();
}

class _NewTrainerInfoScreenState extends State<NewTrainerInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(listener: (context, state) {
      if (state is AdminAcceptedTrainerRequestSuccessState) {
        showToast(text: 'تم الموافقة بنجاح', state: ToastStates.success);
        Timer(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      }
      if (state is AdminRefusedTrainerRequestSuccessState) {
        showToast(text: 'تم الرفض بنجاح', state: ToastStates.success);
        Timer(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'طلب اللتحاق',
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
              )),
        ),
        body: SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              // معلومات الحساب
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.pink, width: 2)),
                child: Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    Header(
                      text: 'الاسم : ' '${widget.model.name}',
                      style: AppTextStyles.smTitles,
                    ),
                    Header(
                      text: 'العمر : ' '${widget.model.age} ',
                      style: AppTextStyles.smTitles,
                    ),
                    Header(
                      text: 'البريد :' '${widget.model.email} ',
                      style: AppTextStyles.smTitles,
                    ),
                    Header(
                      text: 'العنوان : ' '${widget.model.address}',
                      style: AppTextStyles.smTitles,
                    ),
                    Header(
                      text: 'رقم الهاتف : ' '${widget.model.phone}',
                      style: AppTextStyles.smTitles,
                    ),
                    Header(
                      text: ' رقم الهوية : ' '${widget.model.id}',
                      style: AppTextStyles.smTitles,
                    ),
                    Header(
                      text: 'رقم الرخصة : ' '${widget.model.licenseNumber} ',
                      style: AppTextStyles.smTitles,
                    ),
                    Header(
                      text: ' نوع السيارة : ' '${widget.model.carType}',
                      style: AppTextStyles.smTitles,
                    ),
                    // Header(
                    //   text: 'رقم اللوحة : ' '${widget.model.name} ',
                    //   style: AppTextStyles.smTitles,
                    // ),
                    InkWell(
                      onTap: () {
                        if (kDebugMode) {
                          print(widget.model.licenseImage);
                        }
                        launchUrl(Uri.parse(widget.model.licenseImage!));
                      },
                      child: Header(
                        text: ' صورة الرخصة ',
                        style: AppTextStyles.smTitles.apply(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // زر قبول الطلب
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonTemplate(
                    width: width(context, 3),
                    color: AppColors.darkGreen,
                    height: 45,
                    onPressed: () {
                      AdminCubit.get(context)
                          .acceptNewTrainer(uid: widget.model.uid!);
                      AdminCubit.get(context).trainerData.remove(widget.model);
                    },
                    text: 'قبول',
                    textStyle: AppTextStyles.brButton,
                  ),

                  // زر رفض الطلب
                  CustomButtonTemplate(
                    width: width(context, 3),
                    color: AppColors.darkRed,
                    height: 40,
                    onPressed: () {
                      AdminCubit.get(context)
                          .refusedNewTrainer(uid: widget.model.uid!);
                      AdminCubit.get(context).trainerData.remove(widget.model);
                    },
                    text: 'رفض',
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
