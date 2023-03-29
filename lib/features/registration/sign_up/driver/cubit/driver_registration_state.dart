part of 'driver_registration_cubit.dart';

@immutable
abstract class DriverRegistrationState {}

class DriverRegistrationInitialState extends DriverRegistrationState {}

class DriverRegistrationSuccessState extends DriverRegistrationState {
  late final String uid;

  DriverRegistrationSuccessState(this.uid);
}

class DriverRegistrationLoadingState extends DriverRegistrationState {}

class DriverRegistrationErrorState extends DriverRegistrationState {
  late final String error;

  DriverRegistrationErrorState(this.error);
}
