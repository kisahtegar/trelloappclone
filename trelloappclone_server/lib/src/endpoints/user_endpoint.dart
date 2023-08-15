import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for UserEndpoints.
class UserEndpoint extends Endpoint {
  /// Create a new user from UserEndpoint.
  Future<User> createUser(Session session, User user) async {
    // Waiting to insert/create a new user.
    await User.insert(session, user);
    return user;
  }

  /// Get a user by ID from UserEndpoint.
  Future<User?> getUserById(Session session, {required int userId}) async {
    // Get user, find by ID.
    User? user = await User.findById(session, userId);
    return user;
  }

  /// Checking user exist.
  Future<User?> checkUserExists(Session session, User existinguser) async {
    User? user = await User.findSingleRow(
      session,
      where: (u) =>
          u.email.equals(existinguser.email) &
          u.password.equals(existinguser.password),
    );

    return user;
  }
}
