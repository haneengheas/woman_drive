import 'package:flutter/material.dart';

import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import 'comment_info/view.dart';

class CommentListScreen extends StatefulWidget {
  const CommentListScreen({Key? key}) : super(key: key);

  @override
  State<CommentListScreen> createState() => _CommentListScreenState();
}

class _CommentListScreenState extends State<CommentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            ' الشكاوي و التعليقات',
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
              )),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.darkPink,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.darkPink),
                  ),
                  child: ListTile(
                    onTap: () {
                      navigateTo(context, const AdminCommentScreen());
                    },
                    subtitle: const Text('20-11-2022'),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(female),
                      radius: 30,
                    ),
                    title: Text(
                      'منال',
                      style: AppTextStyles.name,
                    ),
                    trailing: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.darkPink,
                          radius: 20,
                          child: index.isEven
                              ? const Image(
                                  image: AssetImage(
                                      closedMessage),
                                  height: 30,
                                  width: 30,
                                )
                              : const Image(
                                  image: AssetImage(
                                      openMessage),
                                  height: 30,
                                  width: 30,
                                ),
                        ),
                        //Image(image: AssetImage('assets/images/messages.png'),height: 20,),
                      ],
                    ),
                  )),
            );
          },
        ));
  }
}
// ToDo:
