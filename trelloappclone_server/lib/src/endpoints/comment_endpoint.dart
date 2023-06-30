import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for CommentEndpoints.
class CommentEndpoint extends Endpoint {
  /// Create a new comment from CommentEndpoint.
  Future<Comment> createComment(
    Session session,
    Comment comment,
  ) async {
    // Waiting to insert/create comment.
    await Comment.insert(session, comment);
    return comment;
  }

  /// Delete a comment from CommentEndpoint.
  Future<bool> deleteComment(Session session, Comment comment) async {
    // waiting for the row of comment to be deleted.
    return await Comment.deleteRow(session, comment);
  }
}
