import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotel_booking_application/pages/splashscree.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  try {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'key1',
          channelName: 'Proto Coders Point',
          channelDescription: 'Notification example',
          defaultColor: const Color(0XFF00897B),
          ledColor: Colors.white,
          playSound: true,
        )
      ],
    );
  } catch (e) {
    print('Error initializing Awesome Notifications: $e');
  }

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  runApp(const MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const OKToast(
      backgroundColor: Colors.grey,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Your App Title',
        home: SplashScreen(),
      ),
    );
  }
}
