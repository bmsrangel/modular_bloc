import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modular_bloc/app/core/repositories/user/users_repository.dart';
import 'package:modular_bloc/app/modules/users/cubits/users/users_states.dart';

class UsersCubit extends Cubit<UsersStates> {
  UsersCubit(this._usersRepository) : super(const LoadingUsersStates());

  final UsersRepository _usersRepository;

  Future<void> getUsers() async {
    try {
      emit(const LoadingUsersStates());
      final users = await _usersRepository.fetchUsers();
      emit(SuccessUsersStates(users: users));
    } catch (e) {
      emit(ErrorUsersStates(message: e.toString()));
    }
  }
}
