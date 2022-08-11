/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/data/datasource/db/CacheDataSource.dart';
import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/repository.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';

class RepositoryImpl extends Repository{

  late UserRepository _userRepository;
  late CacheDataSource _cacheDataSource;

  RepositoryImpl({required CacheDataSource cacheDataSource, required UserRepository userRepository}){
    _userRepository = userRepository;
    _cacheDataSource = cacheDataSource;
  }

  @override
  UserRepository get userRepository => _userRepository;

  @override
  Future<MTaskResult<List<MGame>>> getLevels(MUser user) {
    return _cacheDataSource.getGame(user);
  }

}