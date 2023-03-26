import 'package:flutter/material.dart';
import 'package:woman_drive/shared/styles/styles.dart';

import 'colors.dart';


ThemeData lightTheme =  ThemeData(
  scaffoldBackgroundColor: AppColors.pinkPowder,
  appBarTheme:  AppBarTheme(
    backgroundColor: AppColors.primarycolor,
    toolbarHeight: 60,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColors.brown),
    titleTextStyle:  AppTextStyles.boldtitles.apply(color: AppColors.brown),
  ),);
