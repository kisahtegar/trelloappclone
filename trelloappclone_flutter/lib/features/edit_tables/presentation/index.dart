import 'package:flutter/material.dart';

import 'package:trelloappclone_flutter/utils/config.dart';

class EditLabels extends StatefulWidget {
  const EditLabels({super.key});

  @override
  State<EditLabels> createState() => _EditLabelsState();
}

class _EditLabelsState extends State<EditLabels> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit labels'),
      content: SizedBox(
        height: 190,
        child: Column(children: buildWidget()),
      ),
    );
  }

  List<Widget> buildWidget() {
    final labelContainers = <Widget>[];
    for (var i = 0; i < labels.length; i++) {
      labelContainers.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: labels[i],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      );
    }
    return labelContainers;
  }
}
