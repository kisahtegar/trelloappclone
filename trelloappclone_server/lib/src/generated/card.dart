/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Card extends _i1.TableRow {
  Card({
    int? id,
    required this.listboardId,
    required this.userId,
    required this.name,
    this.description,
    this.startDate,
    this.dueDate,
    this.attachment,
    this.archived,
    this.checklist,
    this.comments,
  }) : super(id);

  factory Card.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Card(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      listboardId: serializationManager
          .deserialize<int>(jsonSerialization['listboardId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      startDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['startDate']),
      dueDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dueDate']),
      attachment: serializationManager
          .deserialize<bool?>(jsonSerialization['attachment']),
      archived: serializationManager
          .deserialize<bool?>(jsonSerialization['archived']),
      checklist: serializationManager
          .deserialize<bool?>(jsonSerialization['checklist']),
      comments: serializationManager
          .deserialize<bool?>(jsonSerialization['comments']),
    );
  }

  static final t = CardTable();

  int listboardId;

  int userId;

  String name;

  String? description;

  DateTime? startDate;

  DateTime? dueDate;

  bool? attachment;

  bool? archived;

  bool? checklist;

  bool? comments;

  @override
  String get tableName => 'card';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'listboardId': listboardId,
      'userId': userId,
      'name': name,
      'description': description,
      'startDate': startDate,
      'dueDate': dueDate,
      'attachment': attachment,
      'archived': archived,
      'checklist': checklist,
      'comments': comments,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'listboardId': listboardId,
      'userId': userId,
      'name': name,
      'description': description,
      'startDate': startDate,
      'dueDate': dueDate,
      'attachment': attachment,
      'archived': archived,
      'checklist': checklist,
      'comments': comments,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'listboardId': listboardId,
      'userId': userId,
      'name': name,
      'description': description,
      'startDate': startDate,
      'dueDate': dueDate,
      'attachment': attachment,
      'archived': archived,
      'checklist': checklist,
      'comments': comments,
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
      case 'listboardId':
        listboardId = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'name':
        name = value;
        return;
      case 'description':
        description = value;
        return;
      case 'startDate':
        startDate = value;
        return;
      case 'dueDate':
        dueDate = value;
        return;
      case 'attachment':
        attachment = value;
        return;
      case 'archived':
        archived = value;
        return;
      case 'checklist':
        checklist = value;
        return;
      case 'comments':
        comments = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Card>> find(
    _i1.Session session, {
    CardExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Card>(
      where: where != null ? where(Card.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Card?> findSingleRow(
    _i1.Session session, {
    CardExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Card>(
      where: where != null ? where(Card.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Card?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Card>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CardExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Card>(
      where: where(Card.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Card row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Card row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Card row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CardExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Card>(
      where: where != null ? where(Card.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CardExpressionBuilder = _i1.Expression Function(CardTable);

class CardTable extends _i1.Table {
  CardTable() : super(tableName: 'card');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final listboardId = _i1.ColumnInt('listboardId');

  final userId = _i1.ColumnInt('userId');

  final name = _i1.ColumnString('name');

  final description = _i1.ColumnString('description');

  final startDate = _i1.ColumnDateTime('startDate');

  final dueDate = _i1.ColumnDateTime('dueDate');

  final attachment = _i1.ColumnBool('attachment');

  final archived = _i1.ColumnBool('archived');

  final checklist = _i1.ColumnBool('checklist');

  final comments = _i1.ColumnBool('comments');

  @override
  List<_i1.Column> get columns => [
        id,
        listboardId,
        userId,
        name,
        description,
        startDate,
        dueDate,
        attachment,
        archived,
        checklist,
        comments,
      ];
}

@Deprecated('Use CardTable.t instead.')
CardTable tCard = CardTable();
