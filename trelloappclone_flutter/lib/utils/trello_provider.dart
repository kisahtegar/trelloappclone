import 'package:flutter/material.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';

class TrelloProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
