import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/features/admin/cubit/admin_cubit.dart';
import 'package:woman_drive/features/admin/home/view.dart';
import 'package:woman_drive/features/driver/cubit/driver_cubit.dart';
import 'package:woman_drive/features/driver/home/view.dart';
import 'package:woman_drive/features/splash/view.dart';
import 'package:woman_drive/features/trainer/home/view.dart';
import 'package:woman_drive/shared/network/local/constant.dart';
import 'package:woman_drive/shared/network/local/shared_preferences.dart';
import 'package:woman_drive/shared/styles/theme.dart';

import 'features/trainer/cubit/trainer_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Widget? widget;
  uId = CacheHelper.getData(key: 'uid');
  var type = CacheHelper.getData(key: 'type');
  var request = CacheHelper.getData(key: 'request');
  print(uId);
  print(type);
  print(request);

  if (uId != null && type == 'trainer' && request == 'accepted') {
    widget = const TrainerHomeScreen();
  } else if (uId != null && type == 'driver' && request == 'accepted') {
    widget = const DriverHomeScreen();
  } else if (uId != null && type == 'admin' && request == 'accepted') {
    widget = const AdminHomeScreen();
  } else {
    widget = const SplashScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({
    this.startWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => AdminCubit()
                ..getTrainersData()
                ..getComment()..getBills()),
          BlocProvider(
              create: (BuildContext context) => TrainerCubit()
                ..getTrainerData()
                ..getReservation()),
          BlocProvider(
              create: (BuildContext context) => DriverCubit()
                ..getDriverData()
                ..getTrainersData()
                ..getReservation()
                ..getComment()),
        ],
        child: MaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          home:  Scaffold(
            body: startWidget!,
          ),
        ));
  }
}
