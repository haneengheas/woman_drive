part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  late final String uid;

  late final String type;
  late final String request;

  LoginSuccessState(this.uid, this.type, this.request);
}

class LoginErrorState extends LoginState {
  late final String error;

  LoginErrorState(this.error);
}

class GetDataSuccessState extends LoginState {
  late final String type;

  GetDataSuccessState(this.type);
}

class GetDataErrorState extends LoginState {
  late final String error;

  GetDataErrorState(this.error);
}
