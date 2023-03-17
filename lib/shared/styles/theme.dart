import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';


ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xffF5F5F5),
  platform: TargetPlatform.iOS,
fontFamily: 'Schyler',
  primaryColor: AppColors.primarycolor,
  primarySwatch: Colors.green,
textTheme: const TextTheme(
  displayLarge: TextStyle(color:AppColors.brown,),
  displayMedium: TextStyle(color:AppColors.brown,),
  bodyMedium: TextStyle(color:AppColors.brown,),
  titleMedium: TextStyle(color:AppColors.brown,),
),
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      toolbarHeight: 50,
      elevation: 0,

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primarycolor),
      titleTextStyle: TextStyle(
        color: AppColors.primarycolor,
        fontSize: 32,
        fontWeight: FontWeight.w500,
     ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primarycolor,
          statusBarIconBrightness: Brightness.light)),
);
