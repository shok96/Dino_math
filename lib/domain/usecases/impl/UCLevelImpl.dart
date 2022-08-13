/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:40
 *
 */

import 'dart:math';

import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MExample.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/domain/repository/repository.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:dino_solver/domain/usecases/intf/UCLevel.dart';
import 'package:dino_solver/domain/usecases/intf/UCMathSolver.dart';

class UCLevelImpl extends UCLevel {

  late Repository _repository;

  UCLevelImpl(Repository repository){
    _repository = repository;
  }

  @override
  Future<MTaskResult<List<MGame>>> getLevels(){
    return _repository.getLevels(_repository.userRepository.getUser());
  }

  @override
  Future<MTaskResult<int>> saveLevels(MGame mGame) {
    return _repository.saveLevels(mGame);
  }

}
