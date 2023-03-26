import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woman_drive/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? model;

  userLogin({required String email, required String password}) {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (kDebugMode) {
        print(value.user!.uid);
        print(value.user!.email);
      }
      getUser(uid: value.user!.uid);
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  getUser({required String uid}) {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      model = UserModel.fromJson(value.data()!);
      emit(GetDataSuccessState(model!.type.toString()));
      emit(LoginSuccessState(uid, model!.type.toString(),model!.request.toString() ));
    }).catchError((error) {
      emit(GetDataErrorState(error.toString()));
    });
  }
}
