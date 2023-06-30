import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for WorkspaceEndpoint
class WorkspaceEndpoint extends Endpoint {
  /// Create Workspace from WorkspaceEndpoint.
  Future<Workspace> createWorkspace(
    Session session,
    Workspace workspace,
  ) async {
    // Waiting to insert/create a new workspace.
    await Workspace.insert(session, workspace);
    return workspace;
  }

  /// Get Workspace by UserID from WorkspaceEndpoint.
  Future<List<Workspace>> getWorkspaceByUser(
    Session session, {
    required int userId,
  }) async {
    // Get workspaces, find workspaces where WorkspaceTable.userID is equal to userId.
    List<Workspace> workspaces = await Workspace.find(
      session,
      where: (w) => w.userId.equals(userId),
    );

    // Looping through the workspaces.
    for (int i = 0; i < workspaces.length; i++) {
      // Get members, find members where MemberTable.workspaceId is equal to workspace[i].id.
      List<Member> members = await Member.find(
        session,
        where: (m) => m.workspaceId.equals(workspaces[i].id),
      );

      workspaces[i].members = members;
    }
    return workspaces;
  }

  /// Get workspace by ID from WorkspaceEndpoint.
  Future<Workspace?> getWorkspaceById(
    Session session, {
    required int workspaceId,
  }) async {
    // Get a workspace, find by ID.
    Workspace? workspace = await Workspace.findById(session, workspaceId);
    return workspace;
  }

  /// Get a boards by workspace from WorkspaceEndpoint.
  Future<List<Board>> getBoardsByWorkspace(
    Session session, {
    required int workspaceId,
  }) async {
    // Get a boards, find boards where BoardTable.workspaceId is equal to workspaceId.
    List<Board> boards = await Board.find(
      session,
      where: (b) => b.workspaceId.equals(workspaceId),
    );
    return boards;
  }

  /// Update a workspace from WorkspaceEndpoint.
  Future<bool> updateWorkspace(Session session, Workspace workspace) async {
    // Waiting to update workspace.
    return await session.db.update(workspace);
  }

  /// Delete a workspace from WorkspaceEndpoint.
  Future<bool> deleteWorkspace(Session session, Workspace workspace) async {
    // Waiting to delete a row of workspace.
    return await Workspace.deleteRow(session, workspace);
  }
}
