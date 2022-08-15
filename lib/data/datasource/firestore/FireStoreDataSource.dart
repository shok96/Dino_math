/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_solver/data/datasource/firestore/firestore_controller.dart';
import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/repository.dart';

abstract class FireStoreDataSource {
  void setUserDoc();

  void setRepositiry(Repository repository);

  Future<MTaskResult<List<MGame>>> getGames();

  //Future<MTaskResult<MGame>> getGameById(int? id);
  //
  Future<MTaskResult<dynamic>> insertMGame(MGame mGame);
}

class FireStoreDataSourceImpl implements FireStoreDataSource {
  FireStoreController _db;
  Repository? _repository;

  FireStoreDataSourceImpl(this._db) {
    // setUserDoc();
  }

  DocumentReference? _user_doc;
  DocumentReference? _level_doc;

  @override
  void setRepositiry(Repository repository) {
    _repository = repository;
  }

  @override
  void setUserDoc() {
    if (_repository != null) {
      if (_repository!.userRepository.getUser().modeUser ==
          ModeUser.firebase()) {
        _user_doc = _db.store
            .collection("Users")
            .doc(_repository!.userRepository.getUser().name);
      }
    }
  }

  void _setLevel(MGame mGame) {
    _level_doc = _user_doc?.collection("levels").doc("L-${mGame.level}");
  }

  @override
  Future<MTaskResult<dynamic>> insertMGame(MGame mGame) async {
    _setLevel(mGame);
    return _db.asyncResult(_level_doc?.set(mGame.toJson()));
  }

  @override
  Future<MTaskResult<List<MGame>>> getGames() {
    return _db.asyncResultSuper<List<MGame>>(
        () => _user_doc
            ?.collection("levels")
            .get(),
        (data) => (data.docs as List).map((i) => MGame.fromJson(i.data())).toList());
  }
}
