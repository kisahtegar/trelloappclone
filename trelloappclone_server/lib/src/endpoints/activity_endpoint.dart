import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for ActivityEndpoints.
class ActivityEndpoint extends Endpoint {
  /// Create a new activity from `ActivityEndpoint`.
  Future<bool> createActivity(Session session, Activity activity) async {
    // Waiting to insert/create activity.
    await Activity.insert(session, activity);
    return true;
  }

  /// Get Activities from `ActivityEndpoint`.
  Future<List<Activity>> getActivities(Session session, Cardlist crd) async {
    List<Activity> activities = await Activity.find(
      session,
      where: (a) => a.cardId.equals(crd.id),
    );
    return activities;
  }
}
