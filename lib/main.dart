import 'package:amazon_flutter/screens/sign_in_screen.dart';
import 'package:amazon_flutter/utils/color_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC0BgOlCkfM_ZlLWc_dVaQRLemE2pzOJhY",
            authDomain: "flutter-61bf6.firebaseapp.com",
            projectId: "flutter-61bf6",
            storageBucket: "flutter-61bf6.appspot.com",
            messagingSenderId: "448647983859",
            appId: "1:448647983859:web:a76edb637a5b1cda8d7d86",
            measurementId: "G-X5KDCTMFVF"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SignInScreen(),
    );
  }
}
