import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/models/driver_model.dart';

part 'driver_registration_state.dart';

class DriverRegistrationCubit extends Cubit<DriverRegistrationState> {
  DriverRegistrationCubit() : super(DriverRegistrationInitialState());

  static DriverRegistrationCubit get(context) => BlocProvider.of(context);

  driverRegister({
    required String name,
    required String email,
    required String password,
    required String age,
    required String phone,
    required String address,
  }) {
    emit(DriverRegistrationLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (kDebugMode) {
        print(value.user!.email);
        print(value.user!.uid);
      }
      FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid)
          .set({'type': 'driver', 'request': 'accepted'});

      driverCreateAccount(
          name: name,
          email: email,
          password: password,
          age: age,
          phone: phone,
          address: address,
          uid: value.user!.uid);
    }).catchError((error) {
      emit(DriverRegistrationErrorState(error.toString()));
    });
  }

  driverCreateAccount(
      {required String name,
      required String email,
      required String password,
      required String age,
      required String phone,
      required String address,
      required String uid}) {
    DriverModel model = DriverModel(
      phone: phone,
      name: name,
      email: email,
      age: age,
      address: address,
      uid: uid,
    );
    FirebaseFirestore.instance
        .collection('driver')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(DriverRegistrationSuccessState(uid));
    }).catchError((error) {
      emit(DriverRegistrationErrorState(error.toString()));
    });
  }
}
