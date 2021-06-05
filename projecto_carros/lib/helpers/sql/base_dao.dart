import 'dart:async';

import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/helpers/sql/db_helper.dart';
import 'package:projecto_carros/helpers/sql/entity.dart';
import 'package:sqflite/sqflite.dart';

// Data Access Object
abstract class BaseDAO<T extends Entity> {
  Future<Database> get db => DatabaseHelper.getInstance().db;

  String get tableName;

  T fromJson(Map<String, dynamic> map);

  Future<int> save(T entity) async {
    var dbClient = await db;
    var id = await dbClient.insert(tableName, entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<List<T>> findAll() async {
    return query('select * from $tableName');
  }

  Future<List<T>> query(String sql, [List<dynamic> arguments]) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery(sql, arguments);

    return list.map<T>((json) => fromJson(json)).toList();
    ;
  }

  Future<T> findById(int id) async {
    List<T> list = await query('select * from carro where id = ?', [id]);

    if (list.length > 0) {
      return list.length > 0 ? list.first : null;
    }

    return null;
  }

  Future<bool> exists(int id) async {
    T c = await findById(id);
    var exists = c != null;
    return exists;
  }

  Future<int> count() async {
    final dbClient = await db;
    final list = await dbClient.rawQuery('select count(*) from carro');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from carro where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from carro');
  }
}
