import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tempt/data/store/api.dart';

import 'data/auth/api.dart';
import 'data/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: defaultFirebaseAppName,
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const AuthService authServiceFireAuth = AuthService.fireAuth;

  // static const StoreService dataServiceDrift = StoreService.drift;
  static const StoreService dataServiceHive = StoreService.hive;
  static const StoreService dataServiceFirestore = StoreService.firestore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Material(
        child: Home(),
      ),
    );
  }
}

/// stf
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> login(BuildContext context) async {
    const auth = MyApp.authServiceFireAuth;

    final user = await auth.login(
      credential: AuthCredential.from(
        authProvider: AuthProvider.github,
        logInMethod: AuthLoginMethod.provider,
      ),
      // credential: AuthCredential.ofPhone(
      //   phoneNumber: '+886 926569268',
      //   verification: () async => (await showDialogAndGetResult<String>(
      //     context: context,
      //     title: 'verification code',
      //     content: TextField(
      //       controller: controller,
      //       decoration: const InputDecoration.collapsed(hintText: 'code'),
      //     ),
      //     actionTitleAndActions: {'ok': () => controller.text},
      //   ))!,
      // ),
      // credential: AuthCredential.ofEmail(
      //   email: 'longtime0110@gmail.com',
      //   passwordOrEmailLink: 'password',
      //   verification: (verifiedChanges) async {},
      // ),
    );
    log(user.toString());
    auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async => await login(context),
      child: const Text('login'),
    );
  }
}
