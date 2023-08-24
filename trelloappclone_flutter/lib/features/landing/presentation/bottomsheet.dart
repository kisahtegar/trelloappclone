import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:trelloappclone_flutter/features/signtotrello/domain/sign_arguments.dart';
import 'package:trelloappclone_flutter/features/signtotrello/presentation/index.dart';
import 'package:trelloappclone_flutter/utils/color.dart';
import 'package:trelloappclone_flutter/utils/config.dart';

class LandingBottomSheet extends StatelessWidget {
  const LandingBottomSheet({required this.type, super.key});
  final Enum type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                SignToTrello.routeName,
                arguments: SignArguments(type),
              );
            },
            leading: const Icon(
              Icons.email,
              color: brandColor,
            ),
            title: Text(
              (type == Sign.signUp)
                  ? ' SIGN UP WITH EMAIL'
                  : 'LOG IN WITH EMAIL',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              MdiIcons.google,
              color: brandColor,
            ),
            title: Text(
              (type == Sign.signUp)
                  ? ' SIGN UP WITH GOOGLE'
                  : 'LOG IN WITH GOOGLE',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              MdiIcons.microsoft,
              color: brandColor,
            ),
            title: Text(
              (type == Sign.signUp)
                  ? ' SIGN UP WITH MICROSOFT'
                  : 'LOG IN WITH MICROSOFT',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              MdiIcons.apple,
              color: brandColor,
            ),
            title: Text(
              (type == Sign.signUp)
                  ? ' SIGN UP WITH APPLE'
                  : 'LOG IN WITH APPLE',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
