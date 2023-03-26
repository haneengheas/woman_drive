// ignore_for_file:  depend_on_referenced_packages, body_might_complete_normally_catch_error, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:woman_drive/models/comment_model.dart';

import '../../../models/trainer_model.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitialState());

  static AdminCubit get(context) => BlocProvider.of(context);

  List<TrainerModel> trainerData = [];
  List<CommentModel> commentList = [];

  getTrainersData() {
    FirebaseFirestore.instance
        .collection('trainer')
        .where('request', isEqualTo: 'waiting')
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                trainerData.add(TrainerModel.fromJson(element.data()));
              }),
              emit(AdminGetTrainerDataSuccessState()),
            })
        .catchError((error) {
      emit(AdminGetTrainerDataErrorState(error.toString()));
    });
  }

  acceptNewTrainer({required String uid}) {
    FirebaseFirestore.instance.collection('trainer').doc(uid).update({
      'request': 'accept',
    }).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'request': 'accepted'})
          .then((value) {})
          .catchError((error) {
            emit(AdminAcceptedTrainerRequestErrorState(error.toString()));
          });
      emit(AdminAcceptedTrainerRequestSuccessState());
    }).catchError((error) {
      emit(AdminAcceptedTrainerRequestErrorState(error.toString()));
    });
  }

  refusedNewTrainer({required String uid}) {
    FirebaseFirestore.instance
        .collection('trainer')
        .doc(uid)
        .delete()
        .then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'request': 'refused'})
          .then((value) {})
          .catchError((error) {
            emit(AdminAcceptedTrainerRequestErrorState(error.toString()));
          });
      emit(AdminRefusedTrainerRequestSuccessState());
    }).catchError((error) {
      emit(AdminRefusedTrainerRequestErrorState(error.toString()));
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
          reply: element['reply'],
          uidDoc: element.id,
        ));
      });
      emit(AdminGetCommentSuccessState());
    }).catchError((error) {
      emit(AdminGetTrainerDataErrorState(error.toString()));
    });
  }

  replyComment({
    required String reply,
    required String uidDoc,
  }) {
    FirebaseFirestore.instance.collection('comment').doc(uidDoc).set(
        {'reply': reply, 'seenAdmin': 'yse'},
        SetOptions(merge: true)).then((value) {
      getComment();
      emit(AdminReplyCommentSuccessState());
    }).catchError((error) {
      emit(AdminReplyCommentErrorState(error.toString()));
    });
  }

  getBills() {
    FirebaseFirestore.instance.collection('trainer').get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
      });
      emit(AdminGetBillsSuccessState());
    }).catchError((error) {
      emit(AdminGetBillsErrorState(error.toString()));
    });
  }
}
