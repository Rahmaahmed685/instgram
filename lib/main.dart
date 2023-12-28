import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instgram/screens/login/page/login_screen.dart';
import 'package:instgram/screens/insta_main_screen.dart';
import 'package:instgram/screens/edit_profile_screen.dart';
import 'package:instgram/screens/profile/page/profile_screen.dart';
import 'package:instgram/screens/story_screen.dart';
import 'package:instgram/shared_prefrances.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferenceUtils.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:
      FirebaseAuth.instance.currentUser == null ?
      LoginScreen():
      InstaMainScreen(),
    );
  }
}
