// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/models/trainer_model.dart';
import 'package:woman_drive/models/trainer_reservation_model.dart';

import '../../../shared/network/local/constant.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerGetDataInitialState());

  static TrainerCubit get(context) => BlocProvider.of(context);
  TrainerModel? model;
  List<TrainerModel> trainerData = [];
  List<TrainerReservationModel> reservationList = [];

  getTrainerData() {
    emit(TrainerGetDataLoadingState());
    FirebaseFirestore.instance
        .collection('trainer')
        .doc(uId)
        .get()
        .then((value) {
      model = TrainerModel.fromJson(value.data()!);
      if (kDebugMode) {
        print(model!.name);
      }
      emit(TrainerGetDataSuccessState());
    }).catchError((error) {
      emit(TrainerGetDataErrorState(error.toString()));
    });
  }

  addTrainerData({
    required String ageDriver,
    required int price,
  }) {
    FirebaseFirestore.instance.collection('trainer').doc(uId).set({
      'ageDriver': ageDriver,
      'price': price,
    }, SetOptions(merge: true)).then((value) {
      emit(TrainerSetDataSuccessState());
    }).catchError((error) {});
  }

  updateProfile({
    required String name,
    required String email,
    required String id,
    required String phone,
    required String age,
    required String address,
    required String licenseNumber,
    required String carType,
  }) {
    FirebaseFirestore.instance.collection('trainer').doc(uId).update({
      'name': name,
      'email': email,
      'id': id,
      'phone': phone,
      'age': age,
      'address': address,
      'licenseNumber': licenseNumber,
      'carType': carType,
    }).then((value) {
      getTrainerData();
      emit(TrainerUpdateProfileSuccessState());
    }).catchError((error) {
      emit(TrainerUpdateProfileErrorState(error.toString()));
    });
  }

  getReservation() {
    FirebaseFirestore.instance
        .collection('reservation')
        .where('uidTrainer', isEqualTo: uId)
        .get()
        .then((value) {
      reservationList.clear();
      for (var element in value.docs) {
        reservationList.add(TrainerReservationModel(
            driverName: element['driverName'],
            hours: element['hours'],
            total: element['total'],
            numHours: element['numHours'],
            accepted: element['accepted'],
            dateOfDay: element['dateOfDay'],
            dayDate: element['dayDate'],
            uidDriver: element['uidDriver'],
            uidDoc: element.id,
            rate: element['rate']));
      }
      emit(TrainerGetReservationSuccessState());
    }).catchError((error) {
      emit(TrainerGetReservationErrorState(error.toString()));
    });
  }

  acceptReservation({required String uidDoc}) {
    FirebaseFirestore.instance
        .collection('reservation')
        .doc(uidDoc)
        .update({'accepted': 'قادم'}).then((value) {
      getReservation();
      emit(TrainerAcceptReservationSuccessState());
    }).catchError((error) {
      emit(TrainerAcceptReservationErrorState(error.toString()));
    });
  }

  refusedReservation({required String uidDoc}) {
    FirebaseFirestore.instance
        .collection('reservation')
        .doc(uidDoc)
        .delete()
        .then((value) {
      getReservation();
      emit(TrainerRefusedReservationSuccessState());
    }).catchError((error) {
      emit(TrainerRefusedReservationErrorState(error.toString()));
    });
  }
}
