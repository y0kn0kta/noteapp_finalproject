import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

/* her şeyden önce yeni bir fire base projesi oluşturacağım
firebase_core
cloud_firestore
google_fonts
Çalışmasını istiyorsak, 
uygulamamıza bir kimlik doğrulama sistemi eklemediğimiz 
için firestore'daki güvenlik kurallarımızı değiştirmeliyiz.
*/
