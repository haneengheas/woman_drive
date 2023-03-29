part of 'driver_cubit.dart';

@immutable
abstract class DriverState {}

class DriverGetDataInitialState extends DriverState {}

class DriverGetDataLoadingState extends DriverState {}

class DriverGetDataSuccessState extends DriverState {}

class DriverGetDataErrorState extends DriverState {
  final String error;

  DriverGetDataErrorState(this.error);
}
class DriverUpdateDataLoadingState extends DriverState {}

class DriverUpdateDataSuccessState extends DriverState {}

class DriverUpdateDataErrorState extends DriverState {
  final String error;

  DriverUpdateDataErrorState(this.error);
}

class DriverGetTrainerDataLoadingState extends DriverState {}

class DriverGetTrainerDataSuccessState extends DriverState {}

class DriverGetTrainerDataErrorState extends DriverState {
  final String error;

  DriverGetTrainerDataErrorState(this.error);
}

class DriverMakeReservationLoadingState extends DriverState {}

class DriverMakeReservationSuccessState extends DriverState {}

class DriverMakeReservationErrorState extends DriverState {
  final String error;

  DriverMakeReservationErrorState(this.error);
}
class DriverGetReservationLoadingState extends DriverState {}

class DriverGetReservationSuccessState extends DriverState {}

class DriverGetReservationErrorState extends DriverState {
  final String error;

  DriverGetReservationErrorState(this.error);
}


class DriverGiveRatingLoadingState extends DriverState {}

class DriverGiveRatingSuccessState extends DriverState {}

class DriverGiveRatingErrorState extends DriverState {
  final String error;

  DriverGiveRatingErrorState(this.error);
}


class DriverMakeCommentLoadingState extends DriverState {}

class DriverMakeCommentSuccessState extends DriverState {}

class DriverMakeCommentErrorState extends DriverState {
  final String error;

  DriverMakeCommentErrorState(this.error);
}

class DriverGetCommentLoadingState extends DriverState {}

class DriverGetCommentSuccessState extends DriverState {}

class DriverGetCommentErrorState extends DriverState {
  final String error;

  DriverGetCommentErrorState(this.error);
}

class DriverUpdateSeenLoadingState extends DriverState {}

class DriverUpdateSeenSuccessState extends DriverState {}

class DriverUpdateSeenErrorState extends DriverState {
  final String error;

  DriverUpdateSeenErrorState(this.error);
}
class DriverGetTrainerReservationLoadingState extends DriverState {}

class DriverGetTrainerReservationSuccessState extends DriverState {}

class DriverGetTrainerReservationErrorState extends DriverState {
  final String error;

  DriverGetTrainerReservationErrorState(this.error);
}
