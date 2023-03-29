part of 'admin_cubit.dart';

@immutable
abstract class AdminState {}

class AdminInitialState extends AdminState {}

class AdminGetTrainerDataSuccessState extends AdminState {}

class AdminGetTrainerDataLoadingState extends AdminState {}

class AdminGetTrainerDataErrorState extends AdminState {
  final String error;
  AdminGetTrainerDataErrorState(this.error);
}

class AdminAcceptedTrainerRequestSuccessState extends AdminState {}

class AdminAcceptedTrainerRequestLoadingState extends AdminState {}

class AdminAcceptedTrainerRequestErrorState extends AdminState {
  final String error;

  AdminAcceptedTrainerRequestErrorState(this.error);
}

class AdminRefusedTrainerRequestSuccessState extends AdminState {}

class AdminRefusedTrainerRequestLoadingState extends AdminState {}

class AdminRefusedTrainerRequestErrorState extends AdminState {
  final String error;

  AdminRefusedTrainerRequestErrorState(this.error);
}

class AdminGetCommentSuccessState extends AdminState {}

class AdminGetCommentLoadingState extends AdminState {}

class AdminGetCommentErrorState extends AdminState {
  final String error;

  AdminGetCommentErrorState(this.error);
}
class AdminReplyCommentSuccessState extends AdminState {}

class AdminReplyCommentLoadingState extends AdminState {}

class AdminReplyCommentErrorState extends AdminState {
  final String error;

  AdminReplyCommentErrorState(this.error);
}
class AdminGetBillsSuccessState extends AdminState {}

class AdminGetBillsLoadingState extends AdminState {}

class AdminGetBillsErrorState extends AdminState {
  final String error;

  AdminGetBillsErrorState(this.error);
}
class AdminGetBillsDetailsSuccessState extends AdminState {}

class AdminGetBillsDetailsLoadingState extends AdminState {}

class AdminGetBillsDetailsErrorState extends AdminState {
  final String error;

  AdminGetBillsDetailsErrorState(this.error);
}

class AdminUpdateBillsSuccessState extends AdminState {}

class AdminUpdateBillsLoadingState extends AdminState {}

class AdminUpdateBillsErrorState extends AdminState {
  final String error;

  AdminUpdateBillsErrorState(this.error);
}
