import 'package:flutter/material.dart';
import 'package:woman_drive/features/admin/cubit/admin_cubit.dart';
import 'package:woman_drive/models/comment_model.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

Future commentReply(
  BuildContext context,
  CommentModel model,
) {
  final formKey = GlobalKey<FormState>();
  TextEditingController replyController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.pinkPowder,
          title: const Center(child: Text('رد')),
          titleTextStyle:
              AppTextStyles.boldtitles.apply(color: AppColors.black),
          insetPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              side: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          content: SizedBox(
            width: width(context, 1),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: TextFieldTemplate(
                  hintText: ' رد علي الشكوي او التعليق',
                  icon: null,
                  lines: 8,
                  controller: replyController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'برجاء الرد علي التعليق او الشكوي ';
                    }
                  },
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: CustomButtonTemplate(
                width: width(context, 3),
                color: AppColors.yellow,
                height: 40,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AdminCubit.get(context).replyComment(
                        reply: replyController.text, uidDoc: model.uidDoc!, );
                    Navigator.pop(context);
                  }
                },
                text: 'ارسال',
                textStyle: AppTextStyles.button,
              ),
            ),
          ],
        );
      });
}
