import 'package:flutter/material.dart';
import 'package:tempt/data/auth/api.dart';
import 'package:tempt/data/store/api.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    Key? key,
    required this.authProvider,
    required this.isNewUser,
    required this.username,
    required this.profile,
  }) : super(key: key);
  final AuthProvider? authProvider;
  final bool? isNewUser;
  final String username;
  final Json profile;

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: build authWidget

    return Container();
  }
}