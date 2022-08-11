/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:drift/drift.dart';

import 'DB.dart';
import 'db_controller.dart';

abstract class CacheDataSource {
  Future<MTaskResult<List<MGame>>> getGame(MUser user);

  Future<MTaskResult<int>> insertMGame(MGame mGame);

  T? emptyData<T>(T? data);
}

class CacheDataSourceImpl implements CacheDataSource {
  DBController _db;

  CacheDataSourceImpl(this._db);

  @override
  Future<MTaskResult<List<MGame>>> getGame(MUser user) async {
    var dbData =
        await _db.asyncResult((_db.store.select(_db.store.eGame)..where((tbl) => tbl.user_id.equals(user.id))).get());

    return getListObjects<MGame, DBEGame>(
        dbData,
        (element) => MGame(
            id: element.id ?? 0,
            level: element.level,
            user_id: element.user_id,
            star: element.star));
  }

  @override
  Future<MTaskResult<int>> insertMGame(MGame mGame) async {
    return upsertObject<MGame, EGameCompanion>(
        mGame,
        _db.store.eGame,
        (element) => EGameCompanion.insert(
            user_id: element.user_id,
            level: element.level,
            star: element.star,
            id: Value(element.id)));
  }

  // @override
  // Future<MTaskResult<List<MPost>>> getPostByUserId(int id) async {
  //   var dbData = await _db.asyncResult((_db.store.select(_db.store.ePost)
  //     ..where((tbl) => tbl.userId.equals(id)))
  //       .get());
  //
  //   return getListObjects<MPost, DBEPost>(
  //       dbData,
  //           (element) => MPost(
  //           id: element.id,
  //           body: element.body,
  //           title: element.title,
  //           userId: element.userId));
  // }
  //
  // @override
  // Future<MTaskResult<List<int>>> insertListMPost(List<MPost> listMPots) async {
  //   return insertListObjects<MPost, EPostCompanion>(
  //       listMPots,
  //       _db.store.ePost,
  //           (element) => EPostCompanion.insert(
  //           id: Value(element.id),
  //           userId: Value(element.userId),
  //           title: Value(element.title),
  //           body: Value(element.body)));
  // }
  //
  // @override
  // Future<MTaskResult<List<MUser>>> getUsers() async {
  //   final query = _db.store.select(_db.store.eUser).join([
  //     leftOuterJoin(_db.store.eCompany,
  //         _db.store.eCompany.id.equalsExp(_db.store.eUser.companyId)),
  //     leftOuterJoin(_db.store.eAddress,
  //         _db.store.eAddress.id.equalsExp(_db.store.eUser.adressId)),
  //     leftOuterJoin(_db.store.eGeo,
  //         _db.store.eGeo.id.equalsExp(_db.store.eAddress.geoId)),
  //   ]);
  //
  //   final mapingQuery = await query.map((row) async {
  //     final companyTable = row.readTableOrNull(_db.store.eCompany);
  //     final addressTable = row.readTableOrNull(_db.store.eAddress);
  //     final geoTable = row.readTableOrNull(_db.store.eGeo);
  //
  //     final userTable = _db.store.eUser;
  //
  //     return MUser(
  //       id: row.read(userTable.id),
  //       name: row.read(userTable.name),
  //       email: row.read(userTable.email),
  //       website: row.read(userTable.website),
  //       phone: row.read(userTable.phone),
  //       username: row.read(userTable.username),
  //       company: MCompany(
  //         name: companyTable?.name,
  //         bs: companyTable?.bs,
  //         catchPhrase: companyTable?.catchPhrase,
  //       ),
  //       address: MAddress(
  //         street: addressTable?.street,
  //         suite: addressTable?.suite,
  //         city: addressTable?.city,
  //         geo: MGeo(
  //           lat: geoTable?.lat,
  //           lng: geoTable?.lng,
  //         ),
  //         zipcode: addressTable?.zipcode,
  //       ),
  //     );
  //   }).get();
  //
  //   return getListObjectsWithQuery(mapingQuery);
  // }
  //
  // @override
  // Future<MTaskResult<List<int>>> insertListUser(List<MUser> listMUser) async {
  //
  //   if (listMUser.length == 0) {
  //     MTaskResult<List<int>> result =
  //     MTaskResult<List<int>>.createBlankCache([-1], true);
  //     return Future.value(result);
  //   }
  //
  //   var action = () {
  //     listMUser.forEach((element) async {
  //       try {
  //         var geo = element.address?.geo;
  //         var address = element.address;
  //         var company = element.company;
  //         var geo_id = 0;
  //         var address_id = 0;
  //         var company_id = 0;
  //
  //         if (geo != null)
  //           geo_id = await _db.store.into(_db.store.eGeo).insert(
  //               EGeoCompanion.insert(lng: Value(geo.lng), lat: Value(geo.lat)));
  //
  //         if (address != null)
  //           address_id = await _db.store.into(_db.store.eAddress).insert(
  //               EAddressCompanion.insert(
  //                   street: Value(address.street),
  //                   city: Value(address.city),
  //                   suite: Value(address.suite),
  //                   zipcode: Value(address.zipcode),
  //                   geoId: geo_id > 0 ? Value(geo_id) : Value.absent()));
  //
  //         if (company != null)
  //           company_id = await _db.store.into(_db.store.eCompany).insert(
  //               ECompanyCompanion.insert(
  //                   name: Value(company.name),
  //                   bs: Value(company.name),
  //                   catchPhrase: Value(company.catchPhrase)));
  //
  //         _db.store.into(_db.store.eUser).insert(EUserCompanion.insert(
  //           name: Value(element.name),
  //           email: Value(element.email),
  //           website: Value(element.website),
  //           phone: Value(element.phone),
  //           username: Value(element.username),
  //           adressId: address_id > 0 ? Value(address_id) : Value.absent(),
  //           companyId: company_id > 0 ? Value(company_id) : Value.absent(),
  //         ));
  //       } catch (e) {
  //         print("insertListUser $e");
  //       }
  //     });
  //   };
  //
  //   var dbData = await _db.asyncResult(action(), Null: true);
  //
  //   if (dbData.isSuccessfull) {
  //     MTaskResult<List<int>> result =
  //     MTaskResult<List<int>>.createBlankCache([0], true);
  //     return Future.value(result);
  //   } else {
  //     MTaskResult<List<int>> result =
  //     MTaskResult<List<int>>.createFailureCache(error: dbData.error);
  //     return Future.value(result);
  //   }
  //
  // }
  //
  //
  // @override
  // Future<MTaskResult<List<MAlbums>>> getAlbumsByUserId(int id) async{
  //   var dbData = await _db.asyncResult((_db.store.select(_db.store.eAlbums)
  //     ..where((tbl) => tbl.userId.equals(id)))
  //       .get());
  //
  //   return getListObjects<MAlbums, DBEAlbums>(
  //       dbData,
  //           (element) => MAlbums(
  //           id: element.id,
  //           title: element.title,
  //           userId: element.userId));
  // }
  //
  // @override
  // Future<MTaskResult<List<MComment>>> getCommentsByPostId(int id) async{
  //   var dbData = await _db.asyncResult((_db.store.select(_db.store.eComment)
  //     ..where((tbl) => tbl.postId.equals(id)))
  //       .get());
  //
  //   return getListObjects<MComment, DBEComment>(
  //       dbData,
  //           (element) => MComment(
  //           id: element.id,
  //           body: element.body,
  //           name: element.name,
  //           email: element.email
  //       ));
  // }
  //
  // @override
  // Future<MTaskResult<List<MPhoto>>> getPhotosByAlbumId(int id) async{
  //   var dbData = await _db.asyncResult((_db.store.select(_db.store.ePhoto)
  //     ..where((tbl) => tbl.albumId.equals(id)))
  //       .get());
  //
  //   return getListObjects<MPhoto, DBEPhoto>(
  //       dbData,
  //           (element) => MPhoto(
  //           id: element.id,
  //           title: element.title,
  //           url: element.url,
  //           thumbnailUrl: element.thumbnailUrl
  //       ));
  // }
  //
  // @override
  // Future<MTaskResult<MUser>> getUserById(int id) async{
  //   final query = _db.store.select(_db.store.eUser).join([
  //     leftOuterJoin(_db.store.eCompany,
  //         _db.store.eCompany.id.equalsExp(_db.store.eUser.companyId)),
  //     leftOuterJoin(_db.store.eAddress,
  //         _db.store.eAddress.id.equalsExp(_db.store.eUser.adressId)),
  //     leftOuterJoin(_db.store.eGeo,
  //         _db.store.eGeo.id.equalsExp(_db.store.eAddress.geoId)),
  //   ])..where(_db.store.eUser.id.equals(id));
  //
  //   final mapingQuery = await query.map((row) async {
  //     final companyTable = row.readTableOrNull(_db.store.eCompany);
  //     final addressTable = row.readTableOrNull(_db.store.eAddress);
  //     final geoTable = row.readTableOrNull(_db.store.eGeo);
  //
  //     final userTable = _db.store.eUser;
  //
  //     return MUser(
  //       id: row.read(userTable.id),
  //       name: row.read(userTable.name),
  //       email: row.read(userTable.email),
  //       website: row.read(userTable.website),
  //       phone: row.read(userTable.phone),
  //       username: row.read(userTable.username),
  //       company: MCompany(
  //         name: companyTable?.name,
  //         bs: companyTable?.bs,
  //         catchPhrase: companyTable?.catchPhrase,
  //       ),
  //       address: MAddress(
  //         street: addressTable?.street,
  //         suite: addressTable?.suite,
  //         city: addressTable?.city,
  //         geo: MGeo(
  //           lat: geoTable?.lat,
  //           lng: geoTable?.lng,
  //         ),
  //         zipcode: addressTable?.zipcode,
  //       ),
  //     );
  //   }).getSingleOrNull();
  //
  //   final dbData = await _db.asyncResult(mapingQuery);
  //
  //   return getObjectWithQuery(dbData);
  // }
  //
  // @override
  // Future<MTaskResult<List<int>>> insertListMAlbums(List<MAlbums> listMPots) {
  //   return insertListObjects<MAlbums, EAlbumsCompanion>(
  //       listMPots,
  //       _db.store.eAlbums,
  //           (element) => EAlbumsCompanion.insert(
  //         id: Value(element.id),
  //         userId: Value(element.userId),
  //         title: Value(element.title),
  //       ));
  // }
  //
  // @override
  // Future<MTaskResult<List<int>>> insertListMComments(List<MComment> listMPots) {
  //   return insertListObjects<MComment, ECommentCompanion>(
  //       listMPots,
  //       _db.store.eComment,
  //           (element) => ECommentCompanion.insert(
  //           id: Value(element.id),
  //           postId: Value(element.postId),
  //           email: Value(element.email),
  //           name: Value(element.name),
  //           body: Value(element.body)));
  // }
  //
  // @override
  // Future<MTaskResult<List<int>>> insertListMPhotos(List<MPhoto> listMPots) {
  //   return insertListObjects<MPhoto, EPhotoCompanion>(
  //       listMPots,
  //       _db.store.ePhoto,
  //           (element) => EPhotoCompanion.insert(
  //           id: Value(element.id),
  //           title: Value(element.title),
  //           thumbnailUrl: Value(element.thumbnailUrl),
  //           url: Value(element.url),
  //           albumId: Value(element.albumId)
  //       ));
  // }

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
      List<T> dataList, TableInfo table, E Function(T element) item) async {
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
        _db.store.batch((batch) =>
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
