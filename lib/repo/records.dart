import '/model/record.dart';
import '/service/db.dart';
import 'package:flutter/material.dart';

class RecordsRepo{

  static add(RecordModel model) async {
    final db = await DBService().connection();
    if (db == null){
      return;
    }

    await db.rawInsert(
      'INSERT INTO records (description, created_at) VALUES (?,?)',
      [model.description, model.created_at.toUtc().millisecondsSinceEpoch],
    );
  }

  static Future<List<RecordModel>> fetchAll() async{
    final db = await DBService().connection();
    if(db == null){
      return [];
    }

    List<Map> list = await db.rawQuery(
        'SELECT id, description, created_at FROM records ORDER BY created_at DESC'
    );
    final result = <RecordModel>[];
    for (final e in list){
      result.add(
        RecordModel(
            id:e['id'],
            description: e['description'],
            created_at: DateTime.fromMillisecondsSinceEpoch(e['created_at'])
        ),
      );
    }
    return result;
  }
}

class RecordsProvider extends ChangeNotifier{
    final List<RecordModel> _list = [];

    List<RecordModel> get list => _list;

    void add (String text) async{
      final model = RecordModel.create(text);
      await RecordsRepo.add(model);
      refresh();
    }

    void refresh() async{
      final result = await RecordsRepo.fetchAll();
      _list
        ..clear()
        ..addAll(result);
      notifyListeners();
    }
}