import 'package:serverpod/serverpod.dart';
import 'package:trelloappclone_server/src/generated/attachment.dart';

/// Class for AttachmentEndpoints.
class AttachmentEndpoint extends Endpoint {
  /// Add a new attachment from AttachmentEndpoint.
  Future<Attachment> addAttachment(
    Session session,
    Attachment attachment,
  ) async {
    // Waiting to insert/create attachment.
    await Attachment.insert(session, attachment);
    return attachment;
  }
}
