import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_fitness/view/menu/menu_view.dart';
import 'Database/auth_controller.dart';
import 'Login/login.dart';
import 'common/color_extension.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
   MyApp({super.key,required this.isLoggedIn});

  bool isLoggedIn;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(AuthControl());
    return MaterialApp(
      title: 'Workout Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: isLoggedIn ? MenuView() : const LogInScreens(),
    );
  }
}


