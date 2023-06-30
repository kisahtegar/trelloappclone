import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for ListBoardEndpoints.
class ListBoardEndpoint extends Endpoint {
  /// Get a lists by board from ListBoardEndpoint.
  Future<List<ListBoard>> getListsByBoard(
    Session session, {
    required int boardId,
  }) async {
    // Get a listsBoard, find where ListBoardTable.boardId is equal to boardId.
    List<ListBoard> listsBoard = await ListBoard.find(
      session,
      where: (l) => l.boardId.equals(boardId),
    );

    // Loop through the listsBoard.
    for (int i = 0; i < listsBoard.length; i++) {
      // Get a cards, find where CardTable.listboardId is equal to listsBoard[i].id.
      List<Card> cards = await Card.find(
        session,
        where: (c) => c.listboardId.equals(listsBoard[i].id),
      );
      listsBoard[i].cards = cards;
    }

    // Then return the listsBoard.
    return listsBoard;
  }

  /// Create list from ListBoardEndpoint.
  Future<ListBoard> createList(Session session, ListBoard listBoard) async {
    // Waiting to insert/create a new listboard.
    await ListBoard.insert(session, listBoard);
    return listBoard;
  }
}
