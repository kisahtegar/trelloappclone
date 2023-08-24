import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';
import 'package:trelloappclone_flutter/features/about_board/presentation/index.dart';
import 'package:trelloappclone_flutter/features/archived_cards/presentation/index.dart';
import 'package:trelloappclone_flutter/features/archived_lists/presentation/index.dart';
import 'package:trelloappclone_flutter/features/board/presentation/index.dart';
import 'package:trelloappclone_flutter/features/board_background/presentation/index.dart';
import 'package:trelloappclone_flutter/features/board_menu/presentation/index.dart';
import 'package:trelloappclone_flutter/features/board_settings/presentation/index.dart';
import 'package:trelloappclone_flutter/features/card_details/presentation/index.dart';
import 'package:trelloappclone_flutter/features/copy_board/presentation/index.dart';
import 'package:trelloappclone_flutter/features/create_board/presentation/index.dart';
import 'package:trelloappclone_flutter/features/create_card/presentation/index.dart';
import 'package:trelloappclone_flutter/features/create_workspace/presentation/index.dart';
import 'package:trelloappclone_flutter/features/email_to_board/presentation/index.dart';
import 'package:trelloappclone_flutter/features/home/presentation/index.dart';
import 'package:trelloappclone_flutter/features/invite_member/presentation/index.dart';
import 'package:trelloappclone_flutter/features/landing/presentation/index.dart';
import 'package:trelloappclone_flutter/features/members/presentation/index.dart';
import 'package:trelloappclone_flutter/features/my_cards/presentation/index.dart';
import 'package:trelloappclone_flutter/features/notifications/presentation/index.dart';
import 'package:trelloappclone_flutter/features/offline_boards/presentation/index.dart';
import 'package:trelloappclone_flutter/features/power_ups/presentation/index.dart';
import 'package:trelloappclone_flutter/features/settings/presentation/index.dart';
import 'package:trelloappclone_flutter/features/signtotrello/presentation/index.dart';
import 'package:trelloappclone_flutter/features/workspace/presentation/index.dart';
import 'package:trelloappclone_flutter/features/workspace_menu/presentation/index.dart';
import 'package:trelloappclone_flutter/features/workspace_settings/presentation/index.dart';
import 'package:trelloappclone_flutter/utils/trello_provider.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
Client client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

// Provider
TrelloProvider trello = TrelloProvider();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trello App Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Landing(),
        '/home': (context) => const Home(),
        '/notifications': (context) => const Notifications(),
        '/workspacemenu': (context) => const WorkspaceMenu(),
        '/workspacesettings': (context) => const WorkspaceSettings(),
        '/members': (context) => const Members(),
        '/invitemember': (context) => const InviteMember(),
        SignToTrello.routeName: (context) => SignToTrello(),
        '/createworkspace': (context) => const CreateWorkspace(),
        '/createboard': (context) => const CreateBoard(),
        '/boardbackground': (context) => const BoardBackground(),
        '/createcard': (context) => const CreateCard(),
        BoardScreen.routeName: (context) => const BoardScreen(),
        '/boardmenu': (context) => const BoardMenu(),
        '/copyboard': (context) => const CopyBoard(),
        '/boardsettings': (context) => const BoardSettings(),
        '/archivedlists': (context) => const ArchivedLists(),
        '/archivedcards': (context) => const ArchivedCards(),
        '/emailtoboard': (context) => const EmailToBoard(),
        '/aboutboard': (context) => const AboutBoard(),
        '/powerups': (context) => const PowerUps(),
        CardDetails.routeName: (context) => const CardDetails(),
        '/mycards': (context) => const MyCards(),
        '/offlineboards': (context) => const OfflineBoards(),
        '/settings': (context) => const Settings(),
        '/workspace': (context) => const WorkspaceScreen()
      },
    );
  }
}
