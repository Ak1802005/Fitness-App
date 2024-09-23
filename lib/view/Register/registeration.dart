import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpack/CustomRadioBtn.dart';
import 'package:loginpack/CustomTxtField.dart';
import 'package:loginpack/Log-in.dart';
import 'package:workout_fitness/Database/auth_controller.dart';
import 'package:workout_fitness/Model/credential.dart';

import '../../Login/login.dart';

class SignUpScreens extends StatelessWidget {
  const SignUpScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(AuthControl());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              primary: false,
              child: Container(
                height: height * 1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/proce/background.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0),
                        child: Text('Register',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: Colors.cyanAccent,
                                    fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Image.asset('assets/proce/RegisterLogo.png', height: 250),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: width * 0.45,
                            child: TxtField(
                                controller: ctrl.firstname,
                                labelTxt: 'First name',
                                hintTxt: 'Enter first name'),
                          ),
                          SizedBox(
                            width: width * 0.45,
                            child: TxtField(
                                controller: ctrl.lastname,
                                labelTxt: 'Last name',
                                hintTxt: 'Enter last name'),
                          ),
                        ]),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                      child: TxtField(
                          controller: ctrl.number,
                          labelTxt: 'Phone number',
                          hintTxt: 'Enter Phone number'),
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                      child: TxtField(
                          controller: ctrl.username,
                          labelTxt: 'Username',
                          hintTxt: 'Enter username'),
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                      child: TxtField(
                          controller: ctrl.pswd,
                          labelTxt: 'Password',
                          hintTxt: 'Enter Password'),
                    ),
                    SizedBox(height: height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Already Have An Account ?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white)),
                        SizedBox(width: width * 0.001),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreens()));
                            },
                            child: Text('Sign In ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.cyanAccent)))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () => ctrl.registerUser(
                              context,
                              credential(
                                  firstName: ctrl.firstname.text.trim(),
                                  lastName: ctrl.lastname.text.trim(),
                                  number: ctrl.number.text.trim(),
                                  userName: ctrl.username.text.trim(),
                                  pswd: ctrl.pswd.text.trim())),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(18)),
                              child: Center(
                                child: Text('Sign Up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(color: Colors.red)),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            )));
  }
}
