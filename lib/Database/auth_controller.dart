// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_fitness/Login/login.dart';
import 'package:workout_fitness/view/menu/menu_view.dart';

import '../Model/credential.dart';
import 'database_controller.dart';

class AuthControl extends GetxController {
  DatabaseControl? _databaseControl;
  credential? usercredential;
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final number = TextEditingController();
  final username = TextEditingController();
  final pswd = TextEditingController();
  final userL = TextEditingController();
  final pswdL = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    currentUser();
  }

  Future<credential?> currentUser() async {
    _databaseControl = await DatabaseControl.getInstance();
    return usercredential;
  }

  Future<void> registerUser(BuildContext context, credential credential) async {
    if (number.text.trim().isNotEmpty &&
        firstname.text.trim().isNotEmpty &&
        lastname.text.trim().isNotEmpty &&
        username.text.trim().isNotEmpty &&
        pswd.text.trim().isNotEmpty) {
      await _databaseControl?.registerUsers(credential);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LogInScreens()));
      firstname.clear();
      lastname.clear();
      number.clear();
      username.clear();
      pswd.clear();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Registration Process Failed',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.red)),
            elevation: 30,
            alignment: AlignmentDirectional.center,
            content: Text(
                '     Please Fill all the fields\n                     and \n     Must Enter True Details.',
                style: Theme.of(context).textTheme.labelLarge),
          );
        },
      );
    }
  }

  Future<void> loginUser(BuildContext context) async {
    if (userL.text.trim().isNotEmpty && pswdL.text.trim().isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      final usercredential = await _databaseControl?.logInUsers(
        username: userL.text.trim(),
        pswd: pswdL.text.trim(),
      );

      if (usercredential != null) {
        await prefs.setString('username', userL.text.trim());
        await prefs.setString('password', pswdL.text.trim());
        prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MenuView(username: userL.text.trim()),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Log In Process Failed',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.red),
              ),
              elevation: 30,
              alignment: AlignmentDirectional.center,
              content: Text(
                '     Something Went Wrong \n     Please Enter Valid User.',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Log In Process Failed',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.red),
            ),
            elevation: 30,
            alignment: AlignmentDirectional.center,
            content: Text(
              '     Please Enter Both Username and Password.',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          );
        },
      );
    }
  }
}
// Future<void> loginUser(BuildContext context) async {
//   {
//     if (userL.text.trim().isNotEmpty && pswdL.text.trim().isNotEmpty) {
//       usercredential = await _databaseControl?.logInUsers(
//           username: userL.text.trim(), pswd: pswdL.text.trim());
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MenuView(username: userL.text.trim()),
//           ));
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Log In Process Failed',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge
//                     ?.copyWith(color: Colors.red)),
//             elevation: 30,
//             alignment: AlignmentDirectional.center,
//             content: Text(
//                 '     Something Went Roung \n     Please Enter Valid User.',
//                 style: Theme.of(context).textTheme.labelLarge),
//           );
//         },
//       );
//     }
//   }
// }
