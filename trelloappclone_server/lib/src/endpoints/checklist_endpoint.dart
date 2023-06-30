import 'package:serverpod/serverpod.dart';
import 'package:trelloappclone_server/src/generated/checklist.dart';

/// Class for ChecklistEndpoints.
class ChecklistEndpoint extends Endpoint {
  /// Create a new checklist from ChecklistEndpoint.
  Future<Checklist> createChecklist(
    Session session,
    Checklist checklist,
  ) async {
    // Waiting to insert/create checklist.
    await Checklist.insert(session, checklist);
    return checklist;
  }

  /// Update a checklist from ChecklistEndpoint.
  Future<bool> updateChecklist(Session session, Checklist checklist) async {
    // Waiting to update checklist.
    return await session.db.update(checklist);
  }

  /// Delete a checklist from ChecklistEndpoint.
  Future<bool> deleteChecklist(Session session, Checklist checklist) async {
    // Waiting to delete row of checklist.
    return await Checklist.deleteRow(session, checklist);
  }
}
