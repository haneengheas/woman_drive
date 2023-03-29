part of 'trainer_cubit.dart';

@immutable
abstract class TrainerState {}

class TrainerGetDataInitialState extends TrainerState {}

class TrainerGetDataLoadingState extends TrainerState {}

class TrainerGetDataSuccessState extends TrainerState {}

class TrainerGetDataErrorState extends TrainerState {
  final String error;

  TrainerGetDataErrorState(this.error);
}

class TrainerSetDataSuccessState extends TrainerState {}

class TrainerSetDataErrorState extends TrainerState {
  final String error;

  TrainerSetDataErrorState(this.error);
}

class TrainerUpdateProfileSuccessState extends TrainerState {}

class TrainerUpdateProfileErrorState extends TrainerState {
  final String error;

  TrainerUpdateProfileErrorState(this.error);
}


class TrainerGetReservationLoadingState extends TrainerState {}

class TrainerGetReservationSuccessState extends TrainerState {}

class TrainerGetReservationErrorState extends TrainerState {
  final String error;

  TrainerGetReservationErrorState(this.error);
}
class TrainerAcceptReservationLoadingState extends TrainerState {}

class TrainerAcceptReservationSuccessState extends TrainerState {}

class TrainerAcceptReservationErrorState extends TrainerState {
  final String error;

  TrainerAcceptReservationErrorState(this.error);
}

class TrainerRefusedReservationLoadingState extends TrainerState {}

class TrainerRefusedReservationSuccessState extends TrainerState {}

class TrainerRefusedReservationErrorState extends TrainerState {
  final String error;

  TrainerRefusedReservationErrorState(this.error);
}

class TrainerUpdateBillsLoadingState extends TrainerState {}

class TrainerUpdateBillsSuccessState extends TrainerState {}

class TrainerUpdateBillsErrorState extends TrainerState {
  final String error;

  TrainerUpdateBillsErrorState(this.error);
}