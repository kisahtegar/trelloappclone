// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';
import 'package:trelloappclone_flutter/features/activity/presentation/index.dart';
import 'package:trelloappclone_flutter/features/card_details/domain/card_detail_arguments.dart';
import 'package:trelloappclone_flutter/features/edit_tables/presentation/index.dart';
import 'package:trelloappclone_flutter/features/view_members/presentation/index.dart';
import 'package:trelloappclone_flutter/utils/color.dart';
import 'package:trelloappclone_flutter/utils/service.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();

  static const routeName = '/carddetail';
}

class _CardDetailsState extends State<CardDetails> with Service {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController checklistController = TextEditingController();
  bool showChecklist = false;
  bool addCardDescription = false;
  Map<int, bool> checked = {};

  @override
  Widget build(BuildContext context) {
    final args =
        // ignore: cast_nullable_to_non_nullable
        ModalRoute.of(context)!.settings.arguments as CardDetailArguments;

    descriptionController.text = args.crd.description ?? ' ';

    return Scaffold(
      appBar: (showChecklist || addCardDescription)
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    showChecklist = false;
                    addCardDescription = false;
                  });
                },
                icon: const Icon(Icons.close, size: 30),
              ),
              title: const Text('New Item'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    if (showChecklist) {
                      createChecklist(
                        Checklist(
                          cardId: args.crd.id!,
                          name: checklistController.text,
                          status: false,
                        ),
                      );
                      checklistController.clear();
                      setState(() {
                        showChecklist = false;
                      });
                    } else if (addCardDescription) {
                      if (descriptionController.text.isNotEmpty) {
                        args.crd.description = descriptionController.text;
                        updateCard(args.crd);
                      }
                    }
                  },
                )
              ],
            )
          : AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, size: 30),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                )
              ],
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.picture_in_picture_sharp),
                  label: const Text('Cover'),
                ),
              ),
              Text(
                args.crd.name,
                style: const TextStyle(fontSize: 20),
              ),
              RichText(
                text: TextSpan(
                  text: args.brd.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: themeColor,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: ' in list ',
                      style: TextStyle(fontSize: 12),
                    ),
                    TextSpan(text: args.lst.name)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  'Quick actions',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            showChecklist = true;
                          });
                        },
                        label: const Text('Add Checklist'),
                        icon: const CircleAvatar(
                          backgroundColor: brandColor,
                          radius: 15,
                          child: Icon(Icons.checklist),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          uploadFile(args.crd);
                        },
                        label: const Text('Add Attachment'),
                        icon: const CircleAvatar(
                          backgroundColor: brandColor,
                          radius: 15,
                          child: Icon(Icons.attachment),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text('Members'),
                        icon: const CircleAvatar(
                          backgroundColor: brandColor,
                          radius: 15,
                          child: Icon(Icons.person),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.short_text),
                title: TextField(
                  controller: descriptionController,
                  onTap: () {
                    setState(() {
                      addCardDescription = true;
                    });
                  },
                  decoration:
                      const InputDecoration(hintText: 'Add card description'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.label),
                title: const Text('Labels'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const EditLabels();
                    },
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Members'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ViewMembers();
                    },
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.date_range_outlined),
                title: const Text('Start date'),
                onTap: () {},
              ),
              ListTile(
                leading: const Text('Checklist'),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      deleteChecklist(args.crd);
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
              FutureBuilder(
                future: getChecklists(args.crd),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // ignore: cast_nullable_to_non_nullable
                    final children = snapshot.data as List<Checklist>;

                    if (children.isNotEmpty) {
                      return Column(children: buildChecklists(children));
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
              Visibility(
                visible: showChecklist,
                child: TextField(
                  controller: checklistController,
                ),
              ),
              const Text('Activity'),
              Activities(args.crd)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 5),
        color: whiteShade,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Add comment',
                  suffix: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.attachment))
          ],
        ),
      ),
    );
  }

  List<Widget> buildChecklists(List<Checklist> chcklst) {
    final lists = <Widget>[];

    for (var i = 0; i < chcklst.length; i++) {
      checked.putIfAbsent(i, () => false);
      checked[i] = chcklst[i].status;
      lists.add(
        CheckboxListTile(
          title: Text(chcklst[i].name),
          value: checked[i],
          onChanged: (bool? value) {
            setState(() {
              checked[i] = value!;
            });
            chcklst[i].status = value!;
            updateChecklist(chcklst[i]);
          },
        ),
      );
    }

    return lists;
  }
}
