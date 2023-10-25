import 'package:flutter/material.dart';
import 'package:hotel_booking_application/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
