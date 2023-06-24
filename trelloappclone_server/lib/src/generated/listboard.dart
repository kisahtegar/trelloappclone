/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class ListBoard extends _i1.TableRow {
  ListBoard({
    int? id,
    required this.boardId,
    required this.userId,
    required this.name,
    this.archived,
    this.cards,
  }) : super(id);

  factory ListBoard.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ListBoard(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      boardId:
          serializationManager.deserialize<int>(jsonSerialization['boardId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      archived: serializationManager
          .deserialize<bool?>(jsonSerialization['archived']),
      cards: serializationManager
          .deserialize<List<_i2.Card>?>(jsonSerialization['cards']),
    );
  }

  static final t = ListBoardTable();

  int boardId;

  int userId;

  String name;

  bool? archived;

  List<_i2.Card>? cards;

  @override
  String get tableName => 'listboard';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'boardId': boardId,
      'userId': userId,
      'name': name,
      'archived': archived,
      'cards': cards,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'boardId': boardId,
      'userId': userId,
      'name': name,
      'archived': archived,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'boardId': boardId,
      'userId': userId,
      'name': name,
      'archived': archived,
      'cards': cards,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'boardId':
        boardId = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'name':
        name = value;
        return;
      case 'archived':
        archived = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ListBoard>> find(
    _i1.Session session, {
    ListBoardExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ListBoard>(
      where: where != null ? where(ListBoard.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ListBoard?> findSingleRow(
    _i1.Session session, {
    ListBoardExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ListBoard>(
      where: where != null ? where(ListBoard.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ListBoard?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ListBoard>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ListBoardExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ListBoard>(
      where: where(ListBoard.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ListBoard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ListBoard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ListBoard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ListBoardExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ListBoard>(
      where: where != null ? where(ListBoard.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ListBoardExpressionBuilder = _i1.Expression Function(ListBoardTable);

class ListBoardTable extends _i1.Table {
  ListBoardTable() : super(tableName: 'listboard');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final boardId = _i1.ColumnInt('boardId');

  final userId = _i1.ColumnInt('userId');

  final name = _i1.ColumnString('name');

  final archived = _i1.ColumnBool('archived');

  @override
  List<_i1.Column> get columns => [
        id,
        boardId,
        userId,
        name,
        archived,
      ];
}

@Deprecated('Use ListBoardTable.t instead.')
ListBoardTable tListBoard = ListBoardTable();
