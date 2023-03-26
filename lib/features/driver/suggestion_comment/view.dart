import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/driver/cubit/driver_cubit.dart';

import 'package:woman_drive/shared/components/navigator.dart';
import 'package:woman_drive/shared/styles/colors.dart';

import '../../../shared/network/local/constant.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../home/view.dart';
import 'comment_info.dart';
import 'new_comment_screen.dart';

class DriverCommentScreen extends StatefulWidget {
  const DriverCommentScreen({Key? key}) : super(key: key);

  @override
  State<DriverCommentScreen> createState() => _DriverCommentScreenState();
}

final formKey = GlobalKey<FormState>();
TextEditingController titleController = TextEditingController();
TextEditingController commentController = TextEditingController();
String today = todayDate();

class _DriverCommentScreenState extends State<DriverCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverState>(
      listener: (context, state) {
        if (state is DriverGetCommentSuccessState) {
          print('get comment successfully');
        }
        if (state is DriverGetCommentErrorState) {
          print(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              ' الشكاوي و التعليقات',
            ),
            leading: IconButton(
                onPressed: () => navigateTo(context, const DriverHomeScreen()),
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                )),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            itemCount: DriverCubit.get(context).commentList.length,
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

                        navigateTo(
                            context,
                            DriverCommentInfo(
                              model:
                                  DriverCubit.get(context).commentList[index],
                            ));
                      },
                      subtitle: Text(
                          '${DriverCubit.get(context).commentList[index].todayDate}'),
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(female),
                        radius: 30,
                      ),
                      title: Text(
                        '${DriverCubit.get(context).commentList[index].name}',
                        style: AppTextStyles.name,
                      ),
                      trailing: Column(
                        children: [
                          DriverCubit.get(context)
                                  .commentList[index]
                                  .reply!
                                  .isEmpty
                              ? const SizedBox()
                              : CircleAvatar(
                                  backgroundColor: AppColors.darkPink,
                                  radius: 20,
                                  child: DriverCubit.get(context)
                                              .commentList[index]
                                              .seenDriver ==
                                          'no'
                                      ? const Image(
                                          image: AssetImage(closedMessage),
                                          height: 30,
                                          width: 30,
                                        )
                                      : const Image(
                                          image: AssetImage(openMessage),
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
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: TextButton.icon(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                  ),
                  backgroundColor: MaterialStateProperty.all(AppColors.yellow),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(color: AppColors.yellow)))),
              onPressed: () {
                navigateTo(context, const NewCommentScreen());
              },
              icon: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
              label: Text(
                'اضافة شكوي او تعليق',
                style: AppTextStyles.brButton,
              )),
        );
      },
    );
  }
}
