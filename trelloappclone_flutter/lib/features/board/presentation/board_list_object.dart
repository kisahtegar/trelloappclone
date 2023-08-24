import 'package:trelloappclone_flutter/features/board/presentation/board_item_object.dart';

class BoardListObject {

  BoardListObject({this.title, this.items}) {
    title ??= '';
    items ??= [];
  }
  String? title;
  List<BoardItemObject>? items;
}
