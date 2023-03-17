import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: InkWell(
                onTap: () => navigateTo(context, const NewTrainerInfoScreen()),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        text: 'منال',
                        style: AppTextStyles.name,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
