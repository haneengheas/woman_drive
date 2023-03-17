import 'package:flutter/material.dart';
import 'package:woman_drive/features/driver/trainer_profile/view.dart';
import 'package:woman_drive/shared/components/constants.dart';
import 'package:woman_drive/shared/components/navigator.dart';
import 'package:woman_drive/shared/styles/styles.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';

class TrainerListScreen extends StatefulWidget {
  const TrainerListScreen({Key? key}) : super(key: key);

  @override
  State<TrainerListScreen> createState() => _TrainerListScreenState();
}

class _TrainerListScreenState extends State<TrainerListScreen> {
  @override
  Widget build(BuildContext context) {
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
            itemCount: trainer.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => navigateTo(context, const TrainerProfileScreen()),
                child: Container(
                  height: 60,
                  width: width(context, 2.5),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: trainer[index]['color']),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         CircleAvatar(
                          backgroundImage:AssetImage(trainer[index]['image']),
                          backgroundColor: trainer[index]['color'],
                          radius: 50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          trainer[index]['name'],
                          style: AppTextStyles.name
                              .apply(color: trainer[index]['textColor']),
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
  }
}

List<Map<String, dynamic>> trainer = [
  {
    'image': woman1,
    'name': 'مني',
    'color': AppColors.pink,
    'textColor': AppColors.red
  },
  {
    'image': woman2,
    'name': 'ايمان',
    'color': AppColors.lightGreen,
    'textColor': AppColors.green
  },
  {
    'image': woman3,
    'name': 'ابتسام',
    'color': AppColors.lightOrange,
    'textColor': AppColors.brown
  },
  {
    'image': woman1,
    'name': 'مني',
    'color': AppColors.pink,
    'textColor': AppColors.red
  },
  {
    'image': woman1,
    'name': 'مني',
    'color': AppColors.pink,
    'textColor': AppColors.red
  },
  {
    'image': woman2,
    'name': 'ايمان',
    'color': AppColors.lightGreen,
    'textColor': AppColors.green
  },
  {
    'image': woman3,
    'name': 'ابتسام',
    'color': AppColors.lightOrange,
    'textColor': AppColors.brown
  },
  {
    'image': woman1,
    'name': 'مني',
    'color': AppColors.pink,
    'textColor': AppColors.red
  },
];
