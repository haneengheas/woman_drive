import 'package:flutter/material.dart';
import 'package:woman_drive/features/splash/view.dart';
import 'package:woman_drive/shared/styles/colors.dart';
import 'package:woman_drive/shared/styles/styles.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.pinkPowder,
        appBarTheme:  AppBarTheme(
        backgroundColor: AppColors.primarycolor,
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.brown),
        titleTextStyle:  AppTextStyles.boldtitles.apply(color: AppColors.brown),
      ),),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
