import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/driver/trainer_profile/view.dart';
import 'package:woman_drive/shared/components/constants.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import 'package:woman_drive/shared/styles/styles.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../cubit/driver_cubit.dart';

class TrainerListScreen extends StatefulWidget {
  const TrainerListScreen({Key? key}) : super(key: key);

  @override
  State<TrainerListScreen> createState() => _TrainerListScreenState();
}

class _TrainerListScreenState extends State<TrainerListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriverState>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = DriverCubit.get(context).model;
          return ConditionalBuilder(
              condition: DriverCubit.get(context).trainersData.isNotEmpty,
              builder: (context) {
                return SafeArea(
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text(
                        'المدربين',
                      ),
                      leading: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios_outlined,
                          )),
                    ),
                    body: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: DriverCubit.get(context).trainersData.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => navigateTo(
                                context,
                                TrainerProfileScreen(
                                  model: DriverCubit.get(context)
                                      .trainersData[index],
                                  image: woman1
                                )),
                            child: Container(
                              height: 60,
                              width: width(context, 2.5),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: index.isEven
                                      ? AppColors.lightGreen
                                      : AppColors.lightOrange),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: index.isEven
                                          ? const AssetImage(woman1)
                                          : const AssetImage(woman2),
                                      backgroundColor: index.isEven
                                          ? AppColors.lightGreen
                                          : AppColors.lightOrange,
                                      radius: 50,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      '${DriverCubit.get(context).trainersData[index].name}',
                                      style: AppTextStyles.name.apply(
                                          color: index.isEven
                                              ? AppColors.green
                                              : AppColors.brown),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              fallback: (context) {
                return const Scaffold(
                  body: LinearProgressIndicator(),
                );
              });
        });
  }
}
