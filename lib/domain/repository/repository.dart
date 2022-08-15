/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/data/datasource/firestore/FireStoreDataSource.dart';
import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';

abstract class Repository{

  UserRepository get userRepository;
  FireStoreDataSource get firestoreDataSource;
  Future<MTaskResult<List<MGame>>> getLevels(MUser user);
  Future<MTaskResult<int>> saveLevels(MGame mGame);
  Future<MTaskResult<int>> updateSyncLevel(MGame mGame);
  Future<MTaskResult<List<int>>> insertMGameFromFireStore(List<MGame> mGames);

}