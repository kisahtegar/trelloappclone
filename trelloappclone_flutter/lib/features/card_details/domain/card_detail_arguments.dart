import 'package:trelloappclone_client/trelloappclone_client.dart';

class CardDetailArguments {

  CardDetailArguments(this.crd, this.brd, this.lst);
  final Cardlist crd;
  final Board brd;
  final ListBoard lst;
}
