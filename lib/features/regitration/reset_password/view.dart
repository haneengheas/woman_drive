import 'package:flutter/material.dart';
import 'package:woman_drive/shared/components/constants.dart';
import 'package:woman_drive/shared/styles/colors.dart';

import '../../../shared/components/components.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('اعادة ضبط كلمة المرور'),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFieldTemplate(
            hintText: 'البريد الالكتروني',
          ),
          ButtonTemplate(
              minwidth: width(context, 2),
              color: AppColors.yellow,
              text1: 'ارسال',
              onPressed: () {}),
        ],
      ),
    ));
  }
}
