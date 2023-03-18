import 'package:flutter/material.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/components/constants.dart';
import 'package:woman_drive/shared/styles/colors.dart';

import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الشكاوي و المقترحات'),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.black,
              )),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

          child: Column(
            children: [
              // الصورة + الاسم
              ProfileImage(
                name: 'وجدان',
                role: 'سائق',
                image: female,
                //onTap: (){},
              ),
              const Divider(
                height: .5,
                thickness: 1,
              ),
               Header(
                text: 'ارسال شكوي او اقتراح',
                 style: AppTextStyles.smTitles,
              ),
              TextFieldTemplate(
                hintText: 'العنوان',
              ),

              TextFieldTemplate(
                hintText: 'اكتب تعليقك او شكواك',
                lines: 6,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonTemplate(
                  minwidth: width(context, 2),
                  color: AppColors.yellow,
                  text1: 'ارسال',
                  onPressed: () => Navigator.pop(context)
  )
            ],
          ),
        ),
      ),
    );
  }
}
