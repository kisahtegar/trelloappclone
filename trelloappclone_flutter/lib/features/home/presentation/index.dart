// ignore_for_file: cast_nullable_to_non_nullable

import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';
import 'package:trelloappclone_flutter/features/board/domain/board_arguments.dart';
import 'package:trelloappclone_flutter/features/board/presentation/index.dart';
import 'package:trelloappclone_flutter/features/drawer/presentation/index.dart';
import 'package:trelloappclone_flutter/features/home/presentation/custom_floating_action.dart';
import 'package:trelloappclone_flutter/utils/color.dart';
import 'package:trelloappclone_flutter/utils/service.dart';
import 'package:trelloappclone_flutter/utils/widgets.dart';

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
        title: const Text('Boards'),
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
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: getWorkspaces(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Workspace>> snapshot,
        ) {
          if (snapshot.hasData) {
            final children = snapshot.data as List<Workspace>;

            if (children.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(children: buildWorkspacesAndBoards(children)),
              );
            }
          }

          // If workspace doesn't have data
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: EmptyWidget(
                packageImage: PackageImage.Image_1,
                title: 'No Boards',
                subTitle: 'Create your first Trello board',
                titleTextStyle: const TextStyle(
                  fontSize: 22,
                  color: Color(0xff9da9c7),
                  fontWeight: FontWeight.w500,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffabb8d6),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        type: ExpandableFabType.up,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add),
          backgroundColor: Colors.green[400],
        ),
        children: const [
          CustomFloatingAction(
            title: 'Workspace',
            icon: Icons.book,
            route: '/createworkspace',
          ),
          CustomFloatingAction(
            title: 'Board',
            icon: Icons.book,
            route: '/createboard',
          ),
          CustomFloatingAction(
            title: 'Card',
            icon: Icons.card_membership,
            route: '/createcard',
          ),
        ],
      ),
    );
  }

  // This used to build workspaces and boards
  List<Widget> buildWorkspacesAndBoards(List<Workspace> wkspcs) {
    final workspacesandboards = <Widget>[];
    Widget workspace;

    // Loop through the workspaces.
    for (var i = 0; i < wkspcs.length; i++) {
      workspace = ListTile(
        tileColor: whiteShade,
        leading: Text(wkspcs[i].name),
        trailing: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/workspacemenu');
          },
          icon: const Icon(Icons.more_horiz),
        ),
      );

      // add workspace
      workspacesandboards
        ..add(workspace)
        ..add(
          // Getting boards
          FutureBuilder(
            future: getBoards(wkspcs[i].id!),
            builder:
                (BuildContext context, AsyncSnapshot<List<Board>> snapshot) {
              if (snapshot.hasData) {
                final children = snapshot.data as List<Board>;

                if (children.isNotEmpty) {
                  return Column(children: buildBoards(children, wkspcs[i]));
                }
              }
              return const SizedBox.shrink();
            },
          ),
        );
    }
    return workspacesandboards;
  }

  // This used to build board
  List<Widget> buildBoards(List<Board> brd, Workspace wkspc) {
    final boards = <Widget>[];
    for (var j = 0; j < brd.length; j++) {
      boards.add(
        ListTile(
          leading: ColorSquare(
            bckgrd: brd[j].background,
          ),
          title: Text(brd[j].name),
          onTap: () {
            Navigator.pushNamed(
              context,
              BoardScreen.routeName,
              arguments: BoardArguments(
                brd[j],
                wkspc.name,
              ),
            );
          },
        ),
      );
    }

    return boards;
  }
}
