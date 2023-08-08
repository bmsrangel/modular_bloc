import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc/app/modules/users/users_module.dart';
import 'package:uno/uno.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addInstance(Uno(baseURL: 'https://jsonplaceholder.typicode.com'));
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module(Modular.initialRoute, module: HomeModule());
    r.module('/users', module: UsersModule());
  }
}
