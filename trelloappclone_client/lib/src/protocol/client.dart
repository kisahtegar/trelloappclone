/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:trelloappclone_client/src/protocol/activity.dart' as _i3;
import 'package:trelloappclone_client/src/protocol/card.dart' as _i4;
import 'package:trelloappclone_client/src/protocol/attachment.dart' as _i5;
import 'package:trelloappclone_client/src/protocol/board.dart' as _i6;
import 'package:trelloappclone_client/src/protocol/workspace.dart' as _i7;
import 'package:trelloappclone_client/src/protocol/checklist.dart' as _i8;
import 'package:trelloappclone_client/src/protocol/comment.dart' as _i9;
import 'package:trelloappclone_client/src/protocol/listboard.dart' as _i10;
import 'package:trelloappclone_client/src/protocol/member.dart' as _i11;
import 'package:trelloappclone_client/src/protocol/user.dart' as _i12;
import 'dart:io' as _i13;
import 'protocol.dart' as _i14;

/// Class for ActivityEndpoints.
class _EndpointActivity extends _i1.EndpointRef {
  _EndpointActivity(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'activity';

  /// Create a new activity from `ActivityEndpoint`.
  _i2.Future<bool> createActivity(_i3.Activity activity) =>
      caller.callServerEndpoint<bool>(
        'activity',
        'createActivity',
        {'activity': activity},
      );

  /// Get Activities from `ActivityEndpoint`.
  _i2.Future<List<_i3.Activity>> getActivities(_i4.Cardlist crd) =>
      caller.callServerEndpoint<List<_i3.Activity>>(
        'activity',
        'getActivities',
        {'crd': crd},
      );
}

/// Class for AttachmentEndpoints.
class _EndpointAttachment extends _i1.EndpointRef {
  _EndpointAttachment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'attachment';

  /// Add a new attachment from `AttachmentEndpoint`.
  _i2.Future<_i5.Attachment> addAttachment(_i5.Attachment attachment) =>
      caller.callServerEndpoint<_i5.Attachment>(
        'attachment',
        'addAttachment',
        {'attachment': attachment},
      );

  /// Get upload deescription from `AttachmentEndpoint`.
  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'attachment',
        'getUploadDescription',
        {'path': path},
      );

  /// Verify upload from `AttachmentEndpoint`.
  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'attachment',
        'verifyUpload',
        {'path': path},
      );
}

/// Class for BoardEndpoints.
class _EndpointBoard extends _i1.EndpointRef {
  _EndpointBoard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'board';

  /// Create a new board from `BoardEndpoint`.
  _i2.Future<_i6.Board> createBoard(_i6.Board board) =>
      caller.callServerEndpoint<_i6.Board>(
        'board',
        'createBoard',
        {'board': board},
      );

  /// Update a board from `BoardEndpoint`.
  _i2.Future<bool> updateBoard(_i6.Board board) =>
      caller.callServerEndpoint<bool>(
        'board',
        'updateBoard',
        {'board': board},
      );

  /// Delete a board from `BoardEndpoint`.
  _i2.Future<bool> deleteBoard(_i6.Board board) =>
      caller.callServerEndpoint<bool>(
        'board',
        'deleteBoard',
        {'board': board},
      );

  /// Get workspace for board from `BoardEndpoint`.
  _i2.Future<_i7.Workspace?> getWorkspaceForBoard(_i6.Board board) =>
      caller.callServerEndpoint<_i7.Workspace?>(
        'board',
        'getWorkspaceForBoard',
        {'board': board},
      );

  /// Get all board from `BoardEndpoint`
  _i2.Future<List<_i6.Board>> getAllBoards() =>
      caller.callServerEndpoint<List<_i6.Board>>(
        'board',
        'getAllBoards',
        {},
      );
}

/// Class for CardEndpoints.
class _EndpointCard extends _i1.EndpointRef {
  _EndpointCard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'card';

  /// Create a new card from CardEndpoint.
  _i2.Future<_i4.Cardlist> createCard(_i4.Cardlist card) =>
      caller.callServerEndpoint<_i4.Cardlist>(
        'card',
        'createCard',
        {'card': card},
      );

  /// Update card from CardEndpoint.
  _i2.Future<bool> updateCard(_i4.Cardlist card) =>
      caller.callServerEndpoint<bool>(
        'card',
        'updateCard',
        {'card': card},
      );
}

/// Class for ChecklistEndpoints.
class _EndpointChecklist extends _i1.EndpointRef {
  _EndpointChecklist(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'checklist';

  /// Create a new checklist from `ChecklistEndpoint`.
  _i2.Future<_i8.Checklist> createChecklist(_i8.Checklist checklist) =>
      caller.callServerEndpoint<_i8.Checklist>(
        'checklist',
        'createChecklist',
        {'checklist': checklist},
      );

  /// Update a checklist from `ChecklistEndpoint`.
  _i2.Future<bool> updateChecklist(_i8.Checklist checklist) =>
      caller.callServerEndpoint<bool>(
        'checklist',
        'updateChecklist',
        {'checklist': checklist},
      );

  /// Delete a checklist item from `ChecklistEndpoint`.
  _i2.Future<bool> deleteChecklistItem(_i8.Checklist checklist) =>
      caller.callServerEndpoint<bool>(
        'checklist',
        'deleteChecklistItem',
        {'checklist': checklist},
      );

  /// Get checklist from `ChecklistEndpoint`.
  _i2.Future<List<_i8.Checklist>> getChecklists(_i4.Cardlist crd) =>
      caller.callServerEndpoint<List<_i8.Checklist>>(
        'checklist',
        'getChecklists',
        {'crd': crd},
      );

  /// Delete a checklist from `ChecklistEndpoint`.
  _i2.Future<int> deleteChecklist(_i4.Cardlist crd) =>
      caller.callServerEndpoint<int>(
        'checklist',
        'deleteChecklist',
        {'crd': crd},
      );
}

/// Class for CommentEndpoints.
class _EndpointComment extends _i1.EndpointRef {
  _EndpointComment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'comment';

  /// Create a new comment from CommentEndpoint.
  _i2.Future<_i9.Comment> createComment(_i9.Comment comment) =>
      caller.callServerEndpoint<_i9.Comment>(
        'comment',
        'createComment',
        {'comment': comment},
      );

  /// Delete a comment from CommentEndpoint.
  _i2.Future<bool> deleteComment(_i9.Comment comment) =>
      caller.callServerEndpoint<bool>(
        'comment',
        'deleteComment',
        {'comment': comment},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// Class for ListBoardEndpoints.
class _EndpointListBoard extends _i1.EndpointRef {
  _EndpointListBoard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'listBoard';

  /// Get a lists by board from ListBoardEndpoint.
  _i2.Future<List<_i10.ListBoard>> getListsByBoard({required int boardId}) =>
      caller.callServerEndpoint<List<_i10.ListBoard>>(
        'listBoard',
        'getListsByBoard',
        {'boardId': boardId},
      );

  /// Create list from ListBoardEndpoint.
  _i2.Future<_i10.ListBoard> createList(_i10.ListBoard listBoard) =>
      caller.callServerEndpoint<_i10.ListBoard>(
        'listBoard',
        'createList',
        {'listBoard': listBoard},
      );
}

/// Class for MemberEndpoints.
class _EndpointMember extends _i1.EndpointRef {
  _EndpointMember(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'member';

  /// Create a new member from MemberEndpoint.
  _i2.Future<_i11.Member> addMember(_i11.Member member) =>
      caller.callServerEndpoint<_i11.Member>(
        'member',
        'addMember',
        {'member': member},
      );

  /// Get a members by workspace from MemberEndpoint.
  _i2.Future<List<_i11.Member>> getMembersByWorkspace(
          {required int workspaceId}) =>
      caller.callServerEndpoint<List<_i11.Member>>(
        'member',
        'getMembersByWorkspace',
        {'workspaceId': workspaceId},
      );

  /// Get a information of members from MemberEndpoint.
  _i2.Future<List<_i12.User>> getInformationOfMembers(
          List<_i11.Member> members) =>
      caller.callServerEndpoint<List<_i12.User>>(
        'member',
        'getInformationOfMembers',
        {'members': members},
      );

  /// Delete a member from MemberEndpoint.
  _i2.Future<_i7.Workspace> deleteMember(
    _i11.Member member,
    _i7.Workspace workspace,
  ) =>
      caller.callServerEndpoint<_i7.Workspace>(
        'member',
        'deleteMember',
        {
          'member': member,
          'workspace': workspace,
        },
      );
}

/// Class for UserEndpoints.
class _EndpointUser extends _i1.EndpointRef {
  _EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  /// Create a new user from UserEndpoint.
  _i2.Future<_i12.User> createUser(_i12.User user) =>
      caller.callServerEndpoint<_i12.User>(
        'user',
        'createUser',
        {'user': user},
      );

  /// Get a user by ID from UserEndpoint.
  _i2.Future<_i12.User?> getUserById({required int userId}) =>
      caller.callServerEndpoint<_i12.User?>(
        'user',
        'getUserById',
        {'userId': userId},
      );

  /// Checking user exist.
  _i2.Future<_i12.User?> checkUserExists(_i12.User existinguser) =>
      caller.callServerEndpoint<_i12.User?>(
        'user',
        'checkUserExists',
        {'existinguser': existinguser},
      );
}

/// Class for WorkspaceEndpoint
class _EndpointWorkspace extends _i1.EndpointRef {
  _EndpointWorkspace(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'workspace';

  /// Create Workspace from WorkspaceEndpoint.
  _i2.Future<_i7.Workspace> createWorkspace(_i7.Workspace workspace) =>
      caller.callServerEndpoint<_i7.Workspace>(
        'workspace',
        'createWorkspace',
        {'workspace': workspace},
      );

  /// Get Workspace by UserID from WorkspaceEndpoint.
  _i2.Future<List<_i7.Workspace>> getWorkspaceByUser({required int userId}) =>
      caller.callServerEndpoint<List<_i7.Workspace>>(
        'workspace',
        'getWorkspaceByUser',
        {'userId': userId},
      );

  /// Get workspace by ID from WorkspaceEndpoint.
  _i2.Future<_i7.Workspace?> getWorkspaceById({required int workspaceId}) =>
      caller.callServerEndpoint<_i7.Workspace?>(
        'workspace',
        'getWorkspaceById',
        {'workspaceId': workspaceId},
      );

  /// Get a boards by workspace from WorkspaceEndpoint.
  _i2.Future<List<_i6.Board>> getBoardsByWorkspace(
          {required int workspaceId}) =>
      caller.callServerEndpoint<List<_i6.Board>>(
        'workspace',
        'getBoardsByWorkspace',
        {'workspaceId': workspaceId},
      );

  /// Update a workspace from WorkspaceEndpoint.
  _i2.Future<bool> updateWorkspace(_i7.Workspace workspace) =>
      caller.callServerEndpoint<bool>(
        'workspace',
        'updateWorkspace',
        {'workspace': workspace},
      );

  /// Delete a workspace from WorkspaceEndpoint.
  _i2.Future<bool> deleteWorkspace(_i7.Workspace workspace) =>
      caller.callServerEndpoint<bool>(
        'workspace',
        'deleteWorkspace',
        {'workspace': workspace},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i13.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i14.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    activity = _EndpointActivity(this);
    attachment = _EndpointAttachment(this);
    board = _EndpointBoard(this);
    card = _EndpointCard(this);
    checklist = _EndpointChecklist(this);
    comment = _EndpointComment(this);
    example = _EndpointExample(this);
    listBoard = _EndpointListBoard(this);
    member = _EndpointMember(this);
    user = _EndpointUser(this);
    workspace = _EndpointWorkspace(this);
  }

  late final _EndpointActivity activity;

  late final _EndpointAttachment attachment;

  late final _EndpointBoard board;

  late final _EndpointCard card;

  late final _EndpointChecklist checklist;

  late final _EndpointComment comment;

  late final _EndpointExample example;

  late final _EndpointListBoard listBoard;

  late final _EndpointMember member;

  late final _EndpointUser user;

  late final _EndpointWorkspace workspace;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'activity': activity,
        'attachment': attachment,
        'board': board,
        'card': card,
        'checklist': checklist,
        'comment': comment,
        'example': example,
        'listBoard': listBoard,
        'member': member,
        'user': user,
        'workspace': workspace,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
