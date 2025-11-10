import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/responsive/mobile_layout_screen.dart';
import 'package:instagram_clone_app/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone_app/responsive/web_layout_screen.dart';
import 'package:instagram_clone_app/screens/login_screen.dart';
import 'package:instagram_clone_app/screens/signup_screen.dart';
import 'package:instagram_clone_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBwl8958WLh5YMnqXlBT50L8j7oIgpetts",
        appId: "1:566781448761:web:fc84b9cb58de8fb4cbf3e8",
        messagingSenderId: "566781448761",
        projectId: "instagram-clone-38fdf",
        storageBucket: "instagram-clone-38fdf.firebasestorage.app",
      ),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayoutScreen(
      //   webScreenLayout: WebLayoutScreen(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
      home: const SignupScreen(),
    );
  }
}
