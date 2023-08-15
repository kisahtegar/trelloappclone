import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:trelloappclone_flutter/utils/config.dart';

import '../../../utils/color.dart';
import '../../../utils/service.dart';
import '../../../utils/widgets.dart';
import 'custom_floating_action.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with Service {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Boards"),
        actions: [
          // Search button
          IconButton(
            onPressed: () {
              search(context);
            },
            icon: const Icon(Icons.search),
          ),
          // Notifications button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
            icon: const Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              tileColor: whiteShade,
              leading: const Text("workspace 1"),
              trailing: IconButton(
                onPressed: () {
                  // navigate to workspace menu screen
                },
                icon: const Icon(Icons.more_horiz),
              ),
            ),
            ListTile(
              leading: ColorSquare(
                bckgrd: backgrounds[0],
              ),
              title: const Text('Board 1'),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        type: ExpandableFabType.up,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add),
          backgroundColor: Colors.green[400],
          fabSize: ExpandableFabSize.regular,
        ),
        children: const [
          CustomFloatingAction(
            title: "Workspace",
            icon: Icons.book,
            route: '/createworkspace',
          ),
          CustomFloatingAction(
            title: "Board",
            icon: Icons.book,
            route: '/createboard',
          ),
          CustomFloatingAction(
            title: "Card",
            icon: Icons.card_membership,
            route: '/createcard',
          ),
        ],
      ),
    );
  }
}
