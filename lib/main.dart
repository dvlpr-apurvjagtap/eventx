import 'package:eventx/controllers/add_screen_controller.dart';
import 'package:eventx/firebase_options.dart';
import 'package:eventx/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddScreenController())
      ],
      child: MaterialApp(
        title: "Eventx",
        home: Home(),
      ),
    );
  }
}
