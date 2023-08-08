import 'package:flutter/material.dart';
import 'package:modular_bloc/app/modules/users/models/user_model.dart';

class UserDetailsPage extends StatefulWidget {
  final UserModel user;

  const UserDetailsPage({super.key, required this.user});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late final UserModel _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_user.name),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('ID: ${_user.id}'),
          ),
          ListTile(
            title: Text('E-mail: ${_user.email}'),
          ),
          ListTile(
            title: Text('Username: ${_user.username}'),
          ),
        ],
      ),
    );
  }
}
