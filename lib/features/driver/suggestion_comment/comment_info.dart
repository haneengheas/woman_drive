import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/comment_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
import '../cubit/driver_cubit.dart';

class DriverCommentInfo extends StatefulWidget {
  final CommentModel model;

  const DriverCommentInfo({required this.model, Key? key}) : super(key: key);

  @override
  State<DriverCommentInfo> createState() => _DriverCommentInfoState();
}

class _DriverCommentInfoState extends State<DriverCommentInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverState>(
      listener: (context, state) {
        if (state is DriverUpdateDataSuccessState) {
          print('updated successfully');

        }
        if (state is DriverUpdateDataErrorState) {
          print(state.error);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'الشكاوي و التعليقات',
                ),
                leading: IconButton(
                    onPressed: ()  {
                      DriverCubit.get(context).updateSeen(
                          uidDoc: widget.model.uidDoc!);
                      Navigator.pop(context);},
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                    )),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: width(context, 1),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.brown, width: 1),
                          color: AppColors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Box(
                            text: 'المرسل : '
                                '${widget.model.name}'
                                '  التاريخ :'
                                '${widget.model.todayDate}',
                            color: AppColors.pinkPowder2,
                            style: AppTextStyles.name,
                          ),
                          Box(
                            text: 'العنوان : '
                                '${widget.model.title}',
                            color: AppColors.pinkPowder2,
                            style: AppTextStyles.name,
                          ),
                          Box(
                            text: '${widget.model.comment}',
                            color: AppColors.pinkPowder2,
                            style: AppTextStyles.name,
                          ),
                          widget.model.reply!.isEmpty
                              ? const SizedBox()
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: Box(
                                    text: '${widget.model.reply}',
                                    color: AppColors.pinkPowder2,
                                    style: AppTextStyles.name,
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
