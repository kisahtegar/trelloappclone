import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Class for MemberEndpoints.
class MemberEndpoint extends Endpoint {
  /// Create a new member from MemberEndpoint.
  Future<Member> addMember(Session session, Member member) async {
    // Waiting to insert/create a new memmber.
    await Member.insert(session, member);
    return member;
  }

  /// Get a members by workspace from MemberEndpoint.
  Future<List<Member>> getMembersByWorkspace(
    Session session, {
    required int workspaceId,
  }) async {
    // Get the members, find the members where MemberTable.workspaceId is equal to
    // workspaceId.
    List<Member> members = await Member.find(
      session,
      where: (m) => m.workspaceId.equals(workspaceId),
    );
    return members;
  }

  /// Get a information of members from MemberEndpoint.
  Future<List<User>> getInformationOfMembers(
    Session session,
    List<Member> members,
  ) async {
    List<User> users = [];

    // Loop through the members.
    for (int i = 0; i < members.length; i++) {
      // Get user, find by id.
      User? user = await User.findById(session, members[i].userId);

      // Then add user to users.
      users.add(user!);
    }

    return users;
  }

  /// Delete a member from MemberEndpoint.
  Future<Workspace> deleteMember(
    Session session,
    Member member,
    Workspace workspace,
  ) async {
    // Waiting to delete member where MemberTable.workspaceId is equal to workspace.id,
    // and MemberTable.id is equal to member.id.
    await Member.delete(
      session,
      where: (m) => m.workspaceId.equals(workspace.id) & m.id.equals(member.id),
    );

    // Get members, find members where MemberTable.workspaceId is equal to workspace.id.
    List<Member> members = await Member.find(
      session,
      where: (m) => m.workspaceId.equals(workspace.id),
    );

    workspace.members = members;
    return workspace;
  }
}
