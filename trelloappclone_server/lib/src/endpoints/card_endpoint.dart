import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for CardEndpoints.
class CardEndpoint extends Endpoint {
  /// Create a new card from CardEndpoint.
  Future<Cardlist> createCard(Session session, Cardlist card) async {
    // Waiting to insert/create card.
    await Cardlist.insert(session, card);
    return card;
  }

  /// Update card from CardEndpoint.
  Future<bool> updateCard(Session session, Cardlist card) async {
    // Waiting to update board.
    return await session.db.update(card);
  }
}
