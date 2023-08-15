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

  /// This function used for creating workspace.
  createWorkspace(
    BuildContext context, {
    required String name,
    required String description,
    required String visibility,
  }) async {
    // workspace object.
    Workspace workspace = Workspace(
      userId: trello.user.id ?? 0,
      name: name,
      description: description,
      visibility: visibility,
    );

    try {
      // Create workspace
      Workspace addedWorkspace =
          await client.workspace.createWorkspace(workspace);

      // Add new member
      Member newMember = Member(
        workspaceId: addedWorkspace.id ?? 0,
        userId: trello.user.id ?? 0,
        name: trello.user.name!,
        role: "Admin",
      );
      await client.member.addMember(newMember);

      // back to home page.
      if (context.mounted) {
        Navigator.pushNamed(context, "/home");
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

  // This function used will get workspaces of a specific user using user ID
  Future<List<Workspace>> getWorkspaces() async {
    List<Workspace> workspaces =
        await client.workspace.getWorkspaceByUser(userId: trello.user.id!);
    trello.setWorkspaces(workspaces);
    return workspaces;
  }

  // This used to create board.
  createBoard(BuildContext context, Board brd) async {
    try {
      await client.board.createBoard(brd);
      if (context.mounted) {
        Navigator.pushNamed(context, "/home");
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

  // Get boards of a specific workspace by Workspace ID
  Future<List<Board>> getBoards(int workspaceId) async {
    List<Board> boards =
        await client.workspace.getBoardsByWorkspace(workspaceId: workspaceId);
    trello.setBoards(boards);
    return boards;
  }
}
