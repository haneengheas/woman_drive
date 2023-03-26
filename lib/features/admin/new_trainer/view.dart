import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/admin/cubit/admin_cubit.dart';
import 'package:woman_drive/shared/components/components.dart';
import 'package:woman_drive/shared/components/navigator.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../new_trainer_info/view.dart';

class NewTrainer extends StatefulWidget {
  const NewTrainer({Key? key}) : super(key: key);

  @override
  State<NewTrainer> createState() => _NewTrainerState();
}

class _NewTrainerState extends State<NewTrainer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: AdminCubit.get(context).trainerData.isNotEmpty,
            builder: (context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'مدربين جدد',
                    ),
                    leading: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_outlined,
                        )),
                  ),
                  body: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    itemCount: AdminCubit.get(context).trainerData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: InkWell(
                          onTap: () => navigateTo(
                              context,
                              NewTrainerInfoScreen(
                                model:
                                    AdminCubit.get(context).trainerData[index],
                              )),
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
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(female),
                                  radius: 30,
                                ),
                                Header(
                                  text: AdminCubit.get(context)
                                      .trainerData[index]
                                      .name,
                                  style: AppTextStyles.name,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ));
            },
            fallback: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'مدربين جدد',
                  ),
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                      )),
                ),
                body: AdminCubit.get(context).trainerData.length ==
                    1 ? const SizedBox() : const LinearProgressIndicator(),
              );
            });
      },
    );
  }
}
