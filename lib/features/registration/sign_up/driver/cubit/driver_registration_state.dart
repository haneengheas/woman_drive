part of 'driver_registration_cubit.dart';

@immutable
abstract class DriverRegistrationState {}

class DriverRegistrationInitialState extends DriverRegistrationState {}

class DriverRegistrationSuccessState extends DriverRegistrationState {}

class DriverRegistrationLoadingState extends DriverRegistrationState {}

class DriverRegistrationErrorState extends DriverRegistrationState {
  late final String error;

  DriverRegistrationErrorState(this.error);
}
