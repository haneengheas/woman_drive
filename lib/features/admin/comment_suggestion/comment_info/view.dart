import 'package:flutter/material.dart';
import 'package:woman_drive/features/admin/comment_suggestion/widget/comment_card.dart';

class AdminCommentScreen extends StatefulWidget {
  const AdminCommentScreen({Key? key}) : super(key: key);

  @override
  State<AdminCommentScreen> createState() => _AdminCommentScreenState();
}

class _AdminCommentScreenState extends State<AdminCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'الشكاوي و التعليقات',

        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_outlined,

            )),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return const CommentCard();
          }),
    );
  }
}
