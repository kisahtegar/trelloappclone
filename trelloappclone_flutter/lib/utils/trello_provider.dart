import 'package:flutter/material.dart';
import 'package:trelloappclone_client/trelloappclone_client.dart';

import 'config.dart';

class TrelloProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  List<Workspace> _workspaces = [];
  List<Workspace> get workspaces => _workspaces;

  List<Board> _boards = [];
  List<Board> get boards => _boards;

  String _selectedBackground = backgrounds[0];
  String get selectedBackground => _selectedBackground;

  List<ListBoard> _lstbrd = [];
  List<ListBoard> get lstbrd => _lstbrd;

  late Board _brd;
  Board get brd => _brd;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setWorkspaces(List<Workspace> workspaces) {
    _workspaces = workspaces;
    notifyListeners();
  }

  void setBoards(List<Board> boards) {
    _boards = boards;
    notifyListeners();
  }

  void setSelectedBg(String selectedBackground) {
    _selectedBackground = selectedBackground;
    notifyListeners();
  }

  void setListBoard(List<ListBoard> lstbrd) {
    _lstbrd = lstbrd;
    notifyListeners();
  }

  void setSelectedBoard(Board brd) {
    _brd = brd;
    notifyListeners();
  }
}
