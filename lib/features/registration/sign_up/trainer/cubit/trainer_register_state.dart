part of 'trainer_register_cubit.dart';

@immutable
abstract class TrainerRegisterState {}

class TrainerRegisterInitialState extends TrainerRegisterState {}

class TrainerRegisterSuccessState extends TrainerRegisterState {}

class TrainerRegisterLoadingState extends TrainerRegisterState {}

class TrainerRegisterErrorState extends TrainerRegisterState {
  late final String error;

  TrainerRegisterErrorState(this.error);
}

class TrainerGetImageSuccessState extends TrainerRegisterState {}

class TrainerGetImageErrorState extends TrainerRegisterState {

  late final String error;

  TrainerGetImageErrorState(this.error);
}

class TrainerUploadImageSuccessState extends TrainerRegisterState {}

class TrainerUploadImageLoadingState extends TrainerRegisterState {}

class TrainerUploadImageErrorState extends TrainerRegisterState {
  late final String error;

  TrainerUploadImageErrorState(this.error);
}
