import 'package:modular_bloc/app/core/repositories/user/users_repository.dart';
import 'package:uno/uno.dart';

import '../../../modules/users/models/user_model.dart';

class UnoUsersRepositoryImpl implements UsersRepository {
  UnoUsersRepositoryImpl(this._uno);

  final Uno _uno;

  @override
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _uno.get('/users');
      return (response.data as List)
          .map((userData) => UserModel.fromJson(userData))
          .toList();
    } catch (error) {
      throw Exception('Failed to retrieve users data');
    }
  }
}
