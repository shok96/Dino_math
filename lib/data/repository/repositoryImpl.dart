/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/data/datasource/db/CacheDataSource.dart';
import 'package:dino_solver/data/datasource/firestore/FireStoreDataSource.dart';
import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/repository.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';

class RepositoryImpl extends Repository{

  late UserRepository _userRepository;
  late CacheDataSource _cacheDataSource;
  late FireStoreDataSource _firestoreDataSource;

  RepositoryImpl({required CacheDataSource cacheDataSource, required UserRepository userRepository, required FireStoreDataSource firestoreDataSource}){
    _userRepository = userRepository;
    _cacheDataSource = cacheDataSource;
    _firestoreDataSource = firestoreDataSource;
    _firestoreDataSource.setRepositiry(this);
    //_firestoreDataSource.setUserDoc();
    _cacheDataSource.setRepositiry(this);
  }

  @override
  UserRepository get userRepository => _userRepository;

  @override
  FireStoreDataSource get firestoreDataSource => _firestoreDataSource;

  @override
  Future<MTaskResult<List<MGame>>> getLevels(MUser user) {
    return _cacheDataSource.getGame(user);
  }

  @override
  Future<MTaskResult<int>> saveLevels(MGame mGame) async{
    return _cacheDataSource.insertMGame(mGame);
  }

  @override
  Future<MTaskResult<int>> updateSyncLevel(MGame mGame) {
    return _cacheDataSource.insertMGame(mGame);
  }

  @override
  Future<MTaskResult<List<int>>> insertMGameFromFireStore(List<MGame> mGames) {
    return _cacheDataSource.insertMGameFromFireStore(mGames);
  }

}