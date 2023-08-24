// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:trelloappclone_flutter/main.dart';
import 'package:trelloappclone_flutter/utils/config.dart';

class BoardBackground extends StatefulWidget {
  const BoardBackground({super.key});

  @override
  State<BoardBackground> createState() => _BoardBackgroundState();
}

class _BoardBackgroundState extends State<BoardBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board background'),
        centerTitle: false,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 3,
          mainAxisSpacing: 20,
        ),
        itemCount: backgrounds.length,
        itemBuilder: (BuildContext cxt, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                trello.setSelectedBg(backgrounds[index]);
              });
            },
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(
                      int.parse(backgrounds[index].substring(1, 7), radix: 16) +
                          0xff000000,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                if (backgrounds[index] == trello.selectedBackground)
                  const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  )
                else
                  const SizedBox.shrink()
              ],
            ),
          );
        },
      ),
    );
  }
}
