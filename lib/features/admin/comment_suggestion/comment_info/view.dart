import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/admin/comment_suggestion/view.dart';
import 'package:woman_drive/models/comment_model.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';
import '../../cubit/admin_cubit.dart';
import '../widget/comment_reply_card.dart';

class AdminCommentScreen extends StatefulWidget {
  final CommentModel model;

  const AdminCommentScreen({required this.model, Key? key}) : super(key: key);

  @override
  State<AdminCommentScreen> createState() => _AdminCommentScreenState();
}

class _AdminCommentScreenState extends State<AdminCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminReplyCommentSuccessState) {
          showToast(text: 'تم الارسال بنجاح', state: ToastStates.success);
          navigateTo(context, const CommentListScreen());
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
                    onPressed: () => navigateTo(context, const CommentListScreen()),
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButtonTemplate(
                              text: 'رد',
                              width: 70,
                              height: 30,
                              color: AppColors.yellow,
                              textStyle: AppTextStyles.button,
                              onPressed: () {
                                commentReply(context, widget.model);
                              },
                            ),
                          )
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
