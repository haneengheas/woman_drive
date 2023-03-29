// ignore_for_file: depend_on_referenced_packages, avoid_function_literals_in_foreach_calls, body_might_complete_normally_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/models/comment_model.dart';
import 'package:woman_drive/models/driver_model.dart';
import 'package:woman_drive/models/driver_reservation_model.dart';
import 'package:woman_drive/models/trainer_model.dart';
import '../../../models/trainer_reservation_model.dart';
import '../../../shared/network/local/constant.dart';

part 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverGetDataInitialState());

  static DriverCubit get(context) => BlocProvider.of(context);
  DriverModel? model;
  List<TrainerModel> trainersData = [];
  List<DriverReservationModel> reservationList = [];
  List<TrainerReservationModel> trainerReservationList = [];
  List<CommentModel> commentList = [];

  getDriverData() {
    emit(DriverGetDataLoadingState());
    FirebaseFirestore.instance
        .collection('driver')
        .doc(uId)
        .get()
        .then((value) {
      model = DriverModel.fromJson(value.data()!);
      if (kDebugMode) {
        print(model!.name);
      }
      emit(DriverGetDataSuccessState());
    }).catchError((error) {
      emit(DriverGetDataErrorState(error.toString()));
    });
  }

  updateDriverDate({
    required String name,
    required String email,
    required String age,
    required String phone,
    required String address,
  }) {
    FirebaseFirestore.instance.collection('driver').doc(uId).update({
      'name': name,
      'email': email,
      'age': age,
      'phone': phone,
      'address': address,
    }).then((value) {
      getDriverData();
      emit(DriverUpdateDataSuccessState());
    }).catchError((error) {
      emit(DriverUpdateDataErrorState(error.toString()));
    });
  }

  getTrainersData() {
    FirebaseFirestore.instance
        .collection('trainer')
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                trainersData.add(TrainerModel.fromJson(element.data()));
              }),
              emit(DriverGetTrainerDataSuccessState()),
            })
        .catchError((error) {
      emit(DriverGetTrainerDataErrorState(error.toString()));
    });
  }

  reservationRequest(
      {required String hours,
      required String dayDate,
      required int numHours,
      required int total,
      required String uidTrainer,
      required String uidDriver,
      required String driverName,
      required String dateOfDay,
      required String trainerName}) {
    FirebaseFirestore.instance.collection('reservation').add({
      'hours': hours,
      'dayDate': dayDate,
      'total': total,
      'uidDriver': uidDriver,
      'accepted': 'قيد المراجعة',
      'dateOfDay': dateOfDay,
      'driverName': driverName,
      'numHours': numHours,
      'trainerName': trainerName,
      'uidTrainer': uidTrainer,
      'rate': 1.5,
      'comment': 'comment',
    }).then((value) {
      getReservation();
      emit(DriverMakeReservationSuccessState());
    }).catchError((error) {
      emit(DriverMakeReservationErrorState(error.toString()));
    });
  }

  giveRating({
    required String uidDoc,
    required double rate,
    required String comment,
  }) {
    FirebaseFirestore.instance
        .collection('reservation')
        .doc(uidDoc)
        .set({'rate': rate, 'comment': comment}, SetOptions(merge: true)).then(
            (value) {
      emit(DriverGiveRatingSuccessState());
    }).catchError((error) {
      emit(DriverGetReservationErrorState(error.toString()));
    });
  }

  getReservation() {
    FirebaseFirestore.instance
        .collection('reservation')
        .where('uidDriver', isEqualTo: uId)
        .get()
        .then((value) {
      reservationList.clear();
      for (var element in value.docs) {
        reservationList.add(DriverReservationModel(
          trainerName: element['trainerName'],
          hours: element['hours'],
          total: element['total'],
          numHours: element['numHours'],
          accepted: element['accepted'],
          dateOfDay: element['dateOfDay'],
          dayDate: element['dayDate'],
          uidTrainer: element['uidTrainer'],
          uidDoc: element.id,
        ));
      }
      emit(DriverGetReservationSuccessState());
    }).catchError((error) {
      emit(DriverGetReservationErrorState(error.toString()));
    });
  }

  makeComment({
    required String title,
    required String comment,
    required String todayDate,
    required String name,
  }) {
    FirebaseFirestore.instance.collection('comment').add({
      'title': title,
      'comment': comment,
      'todayDate': todayDate,
      'uidDriver': uId,
      'name': name,
      'seenAdmin': 'no',
      'seenDriver': 'no',
      'reply': ''
    }).then((value) {
      getComment();
      emit(DriverMakeCommentSuccessState());
    }).catchError((error) {
      emit(DriverMakeCommentErrorState(error.toString()));
    });
  }

  getComment() {
    FirebaseFirestore.instance.collection('comment').get().then((value) {
      commentList.clear();
      value.docs.forEach((element) {
        commentList.add(CommentModel(
          comment: element['comment'],
          title: element['title'],
          todayDate: element['todayDate'],
          uidDriver: element['uidDriver'],
          name: element['name'],
          seenAdmin: element['seenAdmin'],
          seenDriver: element['seenDriver'],
          reply: element['reply'],
          uidDoc: element.id,
        ));
      });
      emit(DriverGetCommentSuccessState());
    }).catchError((error) {
      emit(DriverGetTrainerDataErrorState(error.toString()));
    });
  }

  updateSeen({
    required String uidDoc,
  }) {
    FirebaseFirestore.instance
        .collection('comment')
        .doc(uidDoc)
        .set({'seenDriver': 'yse'}, SetOptions(merge: true)).then((value) {
      getComment();
      emit(DriverUpdateSeenSuccessState());
    }).catchError((error) {
      emit(DriverUpdateSeenErrorState(error.toString()));
    });
  }

  getTrainerReservationComment({required String uidTrainer}) {
    FirebaseFirestore.instance
        .collection('reservation')
        .where('uidTrainer', isEqualTo: uidTrainer)
        .get()
        .then((value) {
      trainerReservationList.clear();
      value.docs.forEach((element) {
        trainerReservationList
            .add(TrainerReservationModel.fromJson(element.data()));
      });
      emit(DriverGetTrainerReservationSuccessState());
    }).catchError((error) {
      emit(DriverGetTrainerReservationErrorState(error.toString()));
    });
  }
}
