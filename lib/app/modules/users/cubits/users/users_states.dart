import '../../models/user_model.dart';

sealed class UsersStates {
  const UsersStates();
}

class LoadingUsersStates implements UsersStates {
  const LoadingUsersStates();
}

class SuccessUsersStates implements UsersStates {
  const SuccessUsersStates({required this.users});

  final List<UserModel> users;
}

class ErrorUsersStates implements UsersStates {
  const ErrorUsersStates({this.message});

  final String? message;
}
