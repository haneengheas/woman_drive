import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/registration/insructions/widget/instruction_info_card.dart';
import 'package:woman_drive/features/registration/login/view.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
import '../sign_up/trainer/cubit/trainer_register_cubit.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrainerRegisterCubit(),
        child: BlocConsumer<TrainerRegisterCubit, TrainerRegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('الشروط و الاحكام '),
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: AppColors.black,
                      )),
                ),
                body: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      const InstructionInfoCard(),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Checkbox(
                              activeColor: AppColors.yellow,
                              value: checked,
                              onChanged: (value) {
                                setState(() {
                                  checked = value;
                                });
                              }),
                          Text(
                            'الموافقة علي الشروط و الاحكام ',
                            style: AppTextStyles.name,
                          ),
                        ],
                      ),
                      ButtonTemplate(
                          minwidth: width(context, 2),
                          color: AppColors.yellow,
                          text1: 'تسجيل',
                          onPressed: () {
                            if (checked == false) {
                              showToast(
                                  text: 'يجب الموافقة علي الشروط و الاحكام ',
                                  state: ToastStates.error);
                            } else {
                              AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  title: "",
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  body: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        "تم ارسال طلبك بنجاح, طلبك قيد المراجعة",
                                        style: AppTextStyles.name,
                                      ),
                                    ),
                                  )).show().then((value){
                                    navigateAndReplace(context, const LoginScreen());
                              });

                            }
                          })
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
