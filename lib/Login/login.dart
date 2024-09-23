import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpack/CustomTxtField.dart';
import 'package:workout_fitness/Database/auth_controller.dart';
import 'package:workout_fitness/view/Register/registeration.dart';

class LogInScreens extends StatelessWidget {
  const LogInScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(AuthControl());
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          primary: false,
          child: Container(
            height: height * 1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/proce/backGround1.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.1),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Log In',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                            color: Colors.cyanAccent,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                Image.asset('assets/proce/LoginLogo.png', height: 250),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                  child: TxtField(
                      controller: ctrl.userL,
                      labelTxt: 'Username',
                      hintTxt: 'Enter username'),
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                  child: TxtField(
                      controller: ctrl.pswdL,
                      labelTxt: 'Password',
                      hintTxt: 'Enter Password'),
                ),
                SizedBox(height: height * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('New User ?',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white)),
                    SizedBox(width: width * 0.001),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => const SignUpScreens())),
                        child: Text('Sign Up ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.cyanAccent)))
                  ],
                ),
                SizedBox(height: height * 0.08),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () => ctrl.loginUser(context),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadiusDirectional.circular(18)),
                          child: Center(
                            child: Text('Sign In',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: Colors.red)),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
