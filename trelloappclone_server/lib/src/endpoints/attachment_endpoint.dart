import 'package:serverpod/serverpod.dart';
import 'package:trelloappclone_server/src/generated/attachment.dart';

/// Class for AttachmentEndpoints.
class AttachmentEndpoint extends Endpoint {
  /// Add a new attachment from `AttachmentEndpoint`.
  Future<Attachment> addAttachment(
    Session session,
    Attachment attachment,
  ) async {
    // Waiting to insert/create attachment.
    await Attachment.insert(session, attachment);
    return attachment;
  }

  /// Get upload deescription from `AttachmentEndpoint`.
  Future<String?> getUploadDescription(Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  /// Verify upload from `AttachmentEndpoint`.
  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }
}
