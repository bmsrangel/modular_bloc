import '../../../modules/users/models/user_model.dart';

abstract interface class UsersRepository {
  Future<List<UserModel>> fetchUsers();
}
