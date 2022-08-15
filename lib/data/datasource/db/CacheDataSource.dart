/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/data/datasource/db/entity/DBEGame.dart';
import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/repository.dart';
import 'package:drift/drift.dart';

import 'DB.dart';
import 'db_controller.dart';

abstract class CacheDataSource {
  void setRepositiry(Repository repository);

  Future<MTaskResult<List<MGame>>> getGame(MUser user);

  Future<MTaskResult<MGame>> getGameById(int? id);

  Future<MTaskResult<int>> insertMGame(MGame mGame);

  Future<MTaskResult<List<int>>> insertMGameFromFireStore(List<MGame> mGames);

  T? emptyData<T>(T? data);
}

class CacheDataSourceImpl implements CacheDataSource {
  DBController _db;
  Repository? _repository;

  CacheDataSourceImpl(this._db);

  @override
  void setRepositiry(Repository repository) {
    _repository = repository;
  }

  @override
  Future<MTaskResult<List<MGame>>> getGame(MUser user) async {
    var dbData = await _db.asyncResult((_db.store.select(_db.store.eGame)
          ..where((tbl) => tbl.user_id.equals(user.id)))
        .get());

    return getListObjects<MGame, DBEGame>(
        dbData,
        (element) => MGame(
            sync: element.sync,
            id: element.id ?? 0,
            level: element.level,
            user_id: element.user_id,
            star: element.star));
  }

  @override
  Future<MTaskResult<int>> insertMGame(MGame mGame) async {
    final getBackup = await getGameById(mGame.id);

    var star = 0;

    if (getBackup.isSuccessfull) {
      if (getBackup.body!.star <= mGame.star) {
        star = mGame.star;
      } else {
        star = getBackup.body!.star;
      }
    } else {
      star = mGame.star;
    }

    return upsertObject<MGame, EGameCompanion>(
        mGame,
        _db.store.eGame,
        (element) => EGameCompanion.insert(
            user_id: element.user_id,
            level: element.level,
            star: star,
            sync: Value(element.sync),
            id: Value(element.id)));
  }

  @override
  Future<MTaskResult<MGame>> getGameById(int? id) async {
    var dbData = await _db.asyncResult((_db.store.select(_db.store.eGame)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull());

    return getObjects<MGame, DBEGame>(
        dbData,
        (element) => MGame(
            id: element.id ?? 0,
            level: element.level,
            user_id: element.user_id,
            star: element.star));
  }

  @override
  Future<MTaskResult<List<int>>> insertMGameFromFireStore(List<MGame> mGames) {
    return insertListObjects<MGame, EGameCompanion>(
        mGames,
        _db.store.eGame,
        (element) => EGameCompanion.insert(
            user_id: element.user_id,
            level: element.level,
            star: element.star,
            sync: Value(true),
            id: Value(element.id)), update: true);
  }

  Future<MTaskResult<List<T>>> getListObjects<T, E>(
      MTaskResult<List<E>> query, T Function(E element) item) {
    if (query.isSuccessfull) {
      List<T> listItem = [];

      query.body?.forEach((element) {
        listItem.add(item(element));
      });

      MTaskResult<List<T>> result =
          MTaskResult<List<T>>.createBlankCache(listItem, true);
      return Future.value(result);
    } else {
      MTaskResult<List<T>> result =
          MTaskResult<List<T>>.createFailureCache(error: query.error);
      return Future.value(result);
    }
  }

  Future<MTaskResult<T>> getObjects<T, E>(
      MTaskResult<E> query, T Function(E element) item) {
    if (query.isSuccessfull) {
      MTaskResult<T> result =
          MTaskResult<T>.createBlankCache(item(query.body!), true);
      return Future.value(result);
    } else {
      MTaskResult<T> result =
          MTaskResult<T>.createFailureCache(error: query.error);
      return Future.value(result);
    }
  }

  Future<MTaskResult<List<T>>> getListObjectsWithQuery<T>(
      List<Future<T>> mapingQuery) async {
    final dbData = await _db.asyncResult(Future.wait(mapingQuery));

    return getObjectWithQuery(dbData);
  }

  Future<MTaskResult<T>> getObjectWithQuery<T>(MTaskResult<T> dbData) {
    if (dbData.isSuccessfull) {
      MTaskResult<T> result =
          MTaskResult<T>.createBlankCache(dbData.body!, true);
      return Future.value(result);
    } else {
      MTaskResult<T> result =
          MTaskResult<T>.createFailureCache(error: dbData.error);
      return Future.value(result);
    }
  }

  Future<MTaskResult<List<int>>> insertListObjects<T, E>(
      List<T> dataList, TableInfo table, E Function(T element) item,
      {bool update = false}) async {
    List<E> listItem = [];

    dataList.forEach((element) {
      listItem.add(item(element));
    });

    if (listItem.length == 0) {
      MTaskResult<List<int>> result =
          MTaskResult<List<int>>.createBlankCache([-1], true);
      return Future.value(result);
    }

    var dbData = await _db.asyncResult(
        update
            ? _db.store.batch((batch) =>
                batch.insertAllOnConflictUpdate(table, listItem as Iterable<Insertable>))
            : _db.store.batch((batch) =>
                batch.insertAll(table, listItem as Iterable<Insertable>)),
        Null: true);

    if (dbData.isSuccessfull) {
      MTaskResult<List<int>> result =
          MTaskResult<List<int>>.createBlankCache([0], true);
      return Future.value(result);
    } else {
      MTaskResult<List<int>> result =
          MTaskResult<List<int>>.createFailureCache(error: dbData.error);
      return Future.value(result);
    }
  }

  Future<MTaskResult<int>> insertObject<T, E>(
      T data, TableInfo table, E Function(T element) item) async {
    var dbData = await _db
        .asyncResult(_db.store.into(table).insert(item(data) as Insertable));

    if (dbData.isSuccessfull) {
      MTaskResult<int> result =
          MTaskResult<int>.createBlankCache(dbData.body!, true);
      return Future.value(result);
    } else {
      MTaskResult<int> result =
          MTaskResult<int>.createFailureCache(error: dbData.error);
      return Future.value(result);
    }
  }

  Future<MTaskResult<int>> upsertObject<T, E>(
      T data, TableInfo table, E Function(T element) item) async {
    var dbData = await _db.asyncResult(
        _db.store.into(table).insertOnConflictUpdate(item(data) as Insertable));

    if (dbData.isSuccessfull) {
      MTaskResult<int> result =
          MTaskResult<int>.createBlankCache(dbData.body!, true);
      return Future.value(result);
    } else {
      MTaskResult<int> result =
          MTaskResult<int>.createFailureCache(error: dbData.error);
      return Future.value(result);
    }
  }

  Future<MTaskResult<int>> deleteObject<T, E>(
      T data, TableInfo table, E Function(T element) item) async {
    var dbData = await _db
        .asyncResult(_db.store.delete(table).delete(item(data) as Insertable));

    if (dbData.isSuccessfull) {
      MTaskResult<int> result =
          MTaskResult<int>.createBlankCache(dbData.body!, true);
      return Future.value(result);
    } else {
      MTaskResult<int> result =
          MTaskResult<int>.createFailureCache(error: dbData.error);
      return Future.value(result);
    }
  }

  Future<MTaskResult<int>> deleteObjectWhere<E extends TableInfo>(
      E table, Expression<bool?> Function(E element) item) async {
    var dbData = await _db
        .asyncResult((_db.store.delete(table)..where((t) => item(table))).go());

    if (dbData.isSuccessfull) {
      MTaskResult<int> result =
          MTaskResult<int>.createBlankCache(dbData.body!, true);
      return Future.value(result);
    } else {
      MTaskResult<int> result =
          MTaskResult<int>.createFailureCache(error: dbData.error);
      return Future.value(result);
    }
  }

  @override
  T? emptyData<T>(T? data) {
    if (data is List) {
      return data.length > 0 ? data : throw Exception("empty cache list data");
    }
    if (data == null) {
      return throw Exception("empty cache data");
    }
    if (data is MTaskResult) {
      return data.isSuccessfull
          ? (data.body is List
              ? ((data.body as List).length > 0
                  ? data
                  : throw Exception("empty cache list data"))
              : data)
          : throw Exception("empty cache data");
    }
    return data;
  }

}
