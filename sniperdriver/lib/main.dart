import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sniperdriver/screen/sign_un_screen.dart/signup_screen.dart';
//import 'package:sniperDriver/firebase_options.dart';
import 'firebase_options.dart';
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "driver project",
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, // تحديد اتجاه النص للغة العربية
          child: child!,
        );
      },
      home: const SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
