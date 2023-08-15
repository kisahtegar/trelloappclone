import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for ChecklistEndpoints.
class ChecklistEndpoint extends Endpoint {
  /// Create a new checklist from `ChecklistEndpoint`.
  Future<Checklist> createChecklist(
    Session session,
    Checklist checklist,
  ) async {
    // Waiting to insert/create checklist.
    await Checklist.insert(session, checklist);
    return checklist;
  }

  /// Update a checklist from `ChecklistEndpoint`.
  Future<bool> updateChecklist(Session session, Checklist checklist) async {
    // Waiting to update checklist.
    return await session.db.update(checklist);
  }

  /// Delete a checklist item from `ChecklistEndpoint`.
  Future<bool> deleteChecklistItem(Session session, Checklist checklist) async {
    // Waiting to delete row of checklist.
    return await Checklist.deleteRow(session, checklist);
  }

  /// Get checklist from `ChecklistEndpoint`.
  Future<List<Checklist>> getChecklists(Session session, Cardlist crd) async {
    return await Checklist.find(
      session,
      where: (c) => c.cardId.equals(crd.id),
    );
  }

  /// Delete a checklist from `ChecklistEndpoint`.
  Future<int> deleteChecklist(Session session, Cardlist crd) async {
    return await Checklist.delete(
      session,
      where: (c) => c.cardId.equals(crd.id),
    );
  }
}
