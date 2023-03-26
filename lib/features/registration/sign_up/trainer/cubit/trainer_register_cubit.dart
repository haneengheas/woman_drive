import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woman_drive/models/trainer_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

part 'trainer_register_state.dart';

class TrainerRegisterCubit extends Cubit<TrainerRegisterState> {
  TrainerRegisterCubit() : super(TrainerRegisterInitialState());

  static TrainerRegisterCubit get(context) => BlocProvider.of(context);
  String? licenseImage;
  String request = 'waiting';
  File? licenseImageFile;
  var picker = ImagePicker();

  trainerRegister({
    required String name,
    required String email,
    required String password,
    required String id,
    required String age,
    required String phone,
    required String address,
    required String carType,
    required String licenseNumber,
  }) {
    emit(TrainerRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (kDebugMode) {
        print(value.user!.email);
        print(value.user!.uid);
        print(request);
      }
      FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid)
          .set({'type': 'trainer', 'request': 'waiting'});

      trainerCreateAccount(
        name: name,
        email: email,
        password: password,
        id: id,
        age: age,
        phone: phone,
        address: address,
        carType: carType,
        licenseNumber: licenseNumber,
        licenseImage: licenseImage!,
        uid: value.user!.uid,
        request: request,
      );
    }).catchError((error) {
      emit(TrainerRegisterErrorState(error.toString()));
    });
  }

  Future<void> getLicenseImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      licenseImageFile = File(pickedFile.path);
      if (kDebugMode) {
        print(pickedFile.path);
      }
      uploadImageLicense();
      emit(TrainerGetImageSuccessState());
    } else {
      if (kDebugMode) {
        emit(TrainerGetImageErrorState('No image selected'));
        print('No image selected');
      }
    }
  }

  void uploadImageLicense() {
    emit(TrainerUploadImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('/license${Uri.file(licenseImageFile!.path).pathSegments.last}')
        .putFile(licenseImageFile!)
        .then((value) {
      if (kDebugMode) {
        print(value);
      }
      value.ref.getDownloadURL().then((value) {
        licenseImage = value;
      }).catchError((error) {
        emit(TrainerUploadImageErrorState(error.toString()));
      });
      emit(TrainerUploadImageSuccessState());
    }).catchError((error) {
      emit(TrainerUploadImageErrorState(error.toString()));
    });
  }

  trainerCreateAccount({
    required String name,
    required String email,
    required String password,
    required String id,
    required String age,
    required String phone,
    required String address,
    required String carType,
    required String licenseNumber,
    required String uid,
    required String licenseImage,
    required String request,
  }) {
    FirebaseFirestore.instance.collection('trainer').doc(uid).set({
      'age': age,
      'address': address,
      'ageDriver': '',
      'carType': carType,
      'email': email,
      'id': id,
      'licenseNumber': licenseNumber,
      'licenseImage': licenseImage,
      'name': name,
      'phone': phone,
      'request': request,
      'uid': uid,
      'price': 0,
      'bills': 0.0,
    }).then((value) {
      emit(TrainerRegisterSuccessState());
    }).catchError((error) {
      emit(TrainerRegisterErrorState(error.toString()));
    });
  }
}
