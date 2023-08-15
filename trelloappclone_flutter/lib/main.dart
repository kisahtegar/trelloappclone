import 'package:trelloappclone_client/trelloappclone_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'features/board/presentation/index.dart';
import 'features/board_background/presentation/index.dart';
import 'features/create_board/presentation/index.dart';
import 'features/create_card/presentation/index.dart';
import 'features/create_workspace/presentation/index.dart';
import 'features/home/presentation/index.dart';
import 'features/landing/presentation/index.dart';
import 'signtotrello/presentation/index.dart';
import 'utils/trello_provider.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

// Provider
TrelloProvider trello = TrelloProvider();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        SignToTrello.routeName: (context) => SignToTrello(),
        '/createworkspace': (context) => const CreateWorkspace(),
        '/createboard': (context) => const CreateBoard(),
        '/boardbackground': (context) => const BoardBackground(),
        '/createcard': (context) => const CreateCard(),
        BoardScreen.routeName: (context) => const BoardScreen(),
        '/boardmenu': (context) => const BoardMenu(),
      },
    );
  }
}
