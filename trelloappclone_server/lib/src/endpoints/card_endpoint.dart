import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for CardEndpoints.
class CardEndpoint extends Endpoint {
  /// Create a new card from CardEndpoint.
  Future<Card> createCard(Session session, Card card) async {
    // Waiting to insert/create card.
    await Card.insert(session, card);
    return card;
  }

  /// Update card from CardEndpoint.
  Future<bool> updateCard(Session session, Card card) async {
    // Waiting to update board.
    return await session.db.update(card);
  }
}
