import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';

import '../main.dart';
import 'color.dart';

mixin Service {
  /// This function used to sign up new user
  signUp(
    User user,
    BuildContext context,
  ) async {
    try {
      // Create user
      await client.user.createUser(user);

      if (context.mounted) {
        Navigator.pushNamed(context, '/');
        StatusAlert.show(
          context,
          duration: const Duration(seconds: 5),
          title: 'Trello Clone',
          subtitle: 'Log in with your new credentials',
          configuration: const IconConfiguration(
            icon: Icons.check,
            color: brandColor,
          ),
          maxWidth: 260,
        );
      }
    } on Exception catch (e) {
      StatusAlert.show(
        context,
        duration: const Duration(seconds: 5),
        title: 'Trello Clone',
        subtitle: e.toString(),
        configuration: const IconConfiguration(
          icon: Icons.check,
          color: brandColor,
        ),
        maxWidth: 260,
      );
    }
  }

  /// This function used for Login
  logIn(User user, BuildContext context) async {
    try {
      User? authenticatedUser = await client.user.checkUserExists(user);
      if (authenticatedUser != null) {
        if (context.mounted) {
          Navigator.pushNamed(context, '/home');
        }
        trello.setUser(authenticatedUser);
      } else {
        if (context.mounted) {
          StatusAlert.show(
            context,
            duration: const Duration(seconds: 5),
            subtitle: "Can't log in? Create an account",
            configuration: const IconConfiguration(
              icon: Icons.sms_failed,
              color: brandColor,
            ),
            maxWidth: 260,
          );
        }
      }
    } on Exception catch (e) {
      StatusAlert.show(
        context,
        duration: const Duration(seconds: 5),
        subtitle: e.toString(),
        configuration: const IconConfiguration(
          icon: Icons.sms_failed,
          color: brandColor,
        ),
        maxWidth: 260,
      );
    }
  }

  /// This function used for encrypt password
  String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  /// This function used for search for a board
  search(BuildContext context) async {}
}
