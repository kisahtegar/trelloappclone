import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for BoardEndpoints.
class BoardEndpoint extends Endpoint {
  /// Create a new board from `BoardEndpoint`.
  Future<Board> createBoard(Session session, Board board) async {
    // Waiting to insert/create board.
    await Board.insert(session, board);
    return board;
  }

  /// Update a board from `BoardEndpoint`.
  Future<bool> updateBoard(Session session, Board board) async {
    // Waiting to update board.
    return await session.db.update(board);
  }

  /// Delete a board from `BoardEndpoint`.
  Future<bool> deleteBoard(Session session, Board board) async {
    // Waiting to delete row of board.
    return await Board.deleteRow(session, board);
  }

  /// Get workspace for board from `BoardEndpoint`.
  Future<Workspace?> getWorkspaceForBoard(Session session, Board board) async {
    // Get workspace, find single row workspace where WorkspaceTable.id is equals to
    // board.workspaceId
    Workspace? workspace = await Workspace.findSingleRow(
      session,
      where: (w) => w.id.equals(board.workspaceId),
    );
    return workspace;
  }

  /// Get all board from `BoardEndpoint`
  Future<List<Board>> getAllBoards(Session session) async {
    List<Board> boards = await Board.find(
      session,
      where: (b) => b.id > 0,
    );
    return boards;
  }
}
