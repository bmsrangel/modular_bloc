import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc/app/modules/users/cubits/users/users_cubit.dart';

import 'cubits/users/users_states.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late final UsersCubit _usersCubit;

  @override
  void initState() {
    super.initState();
    _usersCubit = Modular.get<UsersCubit>();
    _usersCubit.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Center(
        child: BlocBuilder<UsersCubit, UsersStates>(
          bloc: _usersCubit,
          builder: (context, state) => switch (state) {
            LoadingUsersStates() => const CircularProgressIndicator(),
            SuccessUsersStates(users: final users) => ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(users[index].name),
                  onTap: () => Modular.to.pushNamed(
                    'user',
                    arguments: users[index],
                  ),
                ),
              ),
            ErrorUsersStates(message: final message) =>
              Text(message ?? 'Unexpected error'),
          },
        ),
      ),
    );
  }
}
