// ignore_for_file: cast_nullable_to_non_nullable, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';
import 'package:trelloappclone_flutter/features/signtotrello/domain/sign_arguments.dart';
import 'package:trelloappclone_flutter/utils/color.dart';
import 'package:trelloappclone_flutter/utils/config.dart';
import 'package:trelloappclone_flutter/utils/service.dart';

class SignToTrello extends StatelessWidget with Service {
  SignToTrello({super.key});

  static const routeName = '/sign';

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SignArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (args.type == Sign.signUp)
              ? 'Sign up - Log in with Atlassian account'
              : ' Log in to continue -  Log in with Atlassian account ',
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Image.asset(
                logo,
                width: 30,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  (args.type == Sign.signUp)
                      ? 'Sign up to continue'
                      : 'Log in to continue',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  controller: emailcontroller,
                  decoration:
                      const InputDecoration(hintText: 'Enter your email'),
                ),
              ),
              if (args.type == Sign.signUp)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                  ),
                  child: TextField(
                    controller: usernamecontroller,
                    decoration:
                        const InputDecoration(hintText: 'Enter your name'),
                  ),
                )
              else
                const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration:
                      const InputDecoration(hintText: 'Enter your password'),
                ),
              ),
              if (args.type == Sign.signUp)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                  ),
                  child: TextField(
                    controller: confirmcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm your password',
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
              if (args.type == Sign.signUp)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'By signing up, I accept the Atlassian Cloud Terms of Service and acknowledge the Privacy Policy',
                  ),
                )
              else
                const SizedBox.shrink(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (args.type == Sign.signUp && validateSignUp()) {
                      signUp(
                        User(
                          name: usernamecontroller.text,
                          email: emailcontroller.text,
                          password: encryptPassword(passwordcontroller.text),
                        ),
                        context,
                      );
                    } else if (args.type == Sign.logIn && validateLogin()) {
                      logIn(
                        User(
                          email: emailcontroller.text,
                          password: encryptPassword(passwordcontroller.text),
                        ),
                        context,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: brandColor),
                  child: Text(
                    (args.type == Sign.signUp) ? 'Sign up' : 'Log in',
                  ),
                ),
              ),
              // With GOOGLE
              ListTile(
                onTap: () {},
                leading: Icon(
                  MdiIcons.google,
                  color: brandColor,
                ),
                title: const Text(
                  'CONTINUE WITH GOOGLE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // With  Microsoft
              ListTile(
                onTap: () {},
                leading: Icon(
                  MdiIcons.microsoft,
                  color: brandColor,
                ),
                title: const Text(
                  'CONTINUE WITH MICROSOFT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // With apple
              ListTile(
                onTap: () {},
                leading: Icon(
                  MdiIcons.apple,
                  color: brandColor,
                ),
                title: const Text(
                  'CONTINUE WITH APPLE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  (args.type == Sign.signUp)
                      ? 'Already have an Atlassian account? Log in'
                      : "Can't log in? Create an account",
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: brandColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              const Divider(
                height: 1,
                thickness: 1,
                color: brandColor,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 18),
                child: Text(
                  (args.type == Sign.signUp)
                      ? 'This page is protected by reCAPTCHA and the Google Privacy Policy and Terms of Service apply'
                      : 'Privacy Policy . User Notice',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // This used to validate text sign up.
  bool validateSignUp() {
    if (emailcontroller.text.isNotEmpty &&
        passwordcontroller.text.isNotEmpty &&
        confirmcontroller.text.isNotEmpty &&
        confirmcontroller.text == passwordcontroller.text) {
      return true;
    }
    return false;
  }

  // This used to validate text login.
  bool validateLogin() {
    if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
      return true;
    }
    return false;
  }
}
