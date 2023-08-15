import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
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

  /// This used to Get boards of a specific workspace by Workspace ID
  Future<List<Board>> getBoards(int workspaceId) async {
    List<Board> boards =
        await client.workspace.getBoardsByWorkspace(workspaceId: workspaceId);
    trello.setBoards(boards);
    return boards;
  }

  /// This used to update workspace
  Future<bool> updateWorkspace(Workspace wkspc) async {
    return await client.workspace.updateWorkspace(wkspc);
  }

  /// This used to get user by Id
  Future<User?> getUserById(int userId) async {
    User? user = await client.user.getUserById(userId: userId);
    return user;
  }

  /// This used to get information of members
  Future<List<User>> getMembersInformation(List<Member> mmbrs) async {
    List<User> usrs = await client.member.getInformationOfMembers(mmbrs);
    return usrs;
  }

  /// This used to remove Member from Workspace
  Future<Workspace> removeMemberFromWorkspace(
    Member mmbr,
    Workspace wkspc,
  ) async {
    Workspace updatedWorkspace = await client.member.deleteMember(mmbr, wkspc);
    return updatedWorkspace;
  }

  /// This used to update offline status
  Future<bool> updateOfflineStatus(Board brd) async {
    return await client.board.updateBoard(brd);
  }

  /// This used to get lists by board
  Future<List<ListBoard>> getListsByBoard(Board brd) async {
    List<ListBoard> brdlist = await client.listBoard.getListsByBoard(
      boardId: brd.id!,
    );
    trello.setListBoard(brdlist);
    return brdlist;
  }

  /// This used to create activity
  Future<void> createActivity({
    int? boardId,
    required String description,
    int? card,
  }) async {
    await client.activity.createActivity(
      Activity(
        boardId: boardId,
        userId: trello.user.id!,
        cardId: card,
        description: description,
        dateCreated: DateTime.now(),
      ),
    );
  }

  /// This used to get activities of a specific card
  Future<List<Activity>> getActivities(Cardlist crd) async {
    return client.activity.getActivities(crd);
  }

  /// This used to create list board
  Future<void> addList(ListBoard lst) async {
    await client.listBoard.createList(lst);
    createActivity(
      description: "${trello.user.name} added a new list ${lst.name}",
    );
  }

  /// This used to create card
  Future<void> addCard(Cardlist crd) async {
    Cardlist newcrd = await client.card.createCard(crd);
    createActivity(
      card: newcrd.id,
      description: "${trello.user.name} added a new card ${crd.name}",
    );
  }

  /// This used to update card
  Future<void> updateCard(Cardlist crd) async {
    await client.card.updateCard(crd);

    createActivity(
        card: crd.id,
        description: "${trello.user.name} updated the card ${crd.name}");
  }

  /// This used to create comment.
  Future<void> createComment(Comment cmmt) async {
    await client.comment.createComment(cmmt);
  }

  /// This used to create checklist
  Future<void> createChecklist(Checklist chcklst) async {
    await client.checklist.createChecklist(chcklst);
  }

  /// This used to get checklist information.
  Future<List<Checklist>> getChecklists(Cardlist crd) async {
    List<Checklist> chcklsts = await client.checklist.getChecklists(crd);
    return chcklsts;
  }

  /// This used to update checklist.
  Future<void> updateChecklist(Checklist chcklst) async {
    await client.checklist.updateChecklist(chcklst);
  }

  /// This used to delete a checklist.
  Future<void> deleteChecklist(Cardlist crd) async {
    await client.checklist.deleteChecklist(crd);
  }

  /// This used to pick files from device then `addAttachment`
  Future<void> uploadFile(Cardlist crd) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result != null) {
      addAttachment(result.files[0].path ?? "", crd);
    }
  }

  /// This used to add attachment
  Future<bool> addAttachment(String path, Cardlist crd) async {
    var uploadDescription = await client.attachment.getUploadDescription(path);
    bool success = false;
    if (uploadDescription != null) {
      var uploader = FileUploader(uploadDescription);
      await uploader.upload(
        File(path).readAsBytes().asStream(),
        File(path).lengthSync(),
      );
      success = await client.attachment.verifyUpload(path);
    }
    if (success) {
      insertAttachment(crd, path);
    }
    return success;
  }

  /// This used to insert attachment
  Future<void> insertAttachment(Cardlist crd, String path) async {
    await client.attachment.addAttachment(
      Attachment(
        userId: trello.user.id!,
        cardId: crd.id!,
        attachment: path,
      ),
    );
  }
}
