import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc/app/core/repositories/user/uno_users_repository_impl.dart';
import 'package:modular_bloc/app/core/repositories/user/users_repository.dart';
import 'package:modular_bloc/app/modules/users/cubits/users/users_cubit.dart';
import 'package:modular_bloc/app/modules/users/models/user_model.dart';
import 'package:modular_bloc/app/modules/users/pages/user_details_page.dart';
import 'package:modular_bloc/app/modules/users/users_page.dart';

class UsersModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<UsersRepository>(UnoUsersRepositoryImpl.new);
    i.addLazySingleton(UsersCubit.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(Modular.initialRoute, child: (_) => const UsersPage());
    r.child(
      '/user',
      child: (_) => UserDetailsPage(
        user: r.args.data as UserModel,
      ),
    );
  }
}
