import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svendeproeve_klatreapp/flows/authentication/widgets/authentication_wrapper.dart';
import 'package:svendeproeve_klatreapp/flows/reusable/restart_app.dart';
import 'package:svendeproeve_klatreapp/models/user.dart';
import 'package:svendeproeve_klatreapp/services/auth.dart';
import 'firebase_options.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const RestartWidget(child: MyApp()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass?>.value(
      value: AuthService().user,
      catchError: (context, error) {
        return null;
      },
      initialData: null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
