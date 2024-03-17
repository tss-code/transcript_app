import 'package:sqflite/sqflite.dart';
import 'package:transcript/app/core/utils/local_db_utils.dart';
import 'package:transcript/app/domain/interfaces/local_data_store.dart';

class SqfliteSource implements ILocalDataSource {
  @override
  Future fetchDataFromLocal(LocalDBUtils localDBUtils) async {
    try {
      Database db = await _openDataBase(localDBUtils);
      final dataFromDB = await db.query(localDBUtils.tableName!);
      return dataFromDB;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future sendDataToLocal(
      LocalDBUtils localDBUtils, Map<String, Object?> values) async {
    try {
      Database db = await _openDataBase(localDBUtils);
      int version = await db.insert(localDBUtils.tableName!, values);
      return version;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteDataFromLocal(
      LocalDBUtils localDBUtils, Map<String, Object?> values) async {
    try {
      Database db = await _openDataBase(localDBUtils);
      int version = await db.delete(localDBUtils.tableName!);
      return version;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateDataToLocal(
      LocalDBUtils localDBUtils, Map<String, Object?> values) async {
    try {
      Database db = await _openDataBase(localDBUtils);
      int version = await db.update(localDBUtils.tableName!, values);
      return version;
    } catch (e) {
      rethrow;
    }
  }

  Future _openDataBase(LocalDBUtils localDBUtils) async {
    String databasePaths = await getDatabasesPath();
    String realPath = "$databasePaths/${localDBUtils.path}";

    try {
      Database db = await openDatabase(
        realPath,
        version: localDBUtils.version,
        onCreate: (db, version) async {
          await db.execute(localDBUtils.sqlCodeOnCreate!);
        },
      );
      return db;
    } catch (e) {
      rethrow;
    }
  }
}
