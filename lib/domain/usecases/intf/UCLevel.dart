
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:24
 *
 */


import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';

abstract class UCLevel {

  Future<MTaskResult<List<MGame>>> getLevels();
  Future<MTaskResult<int>> saveLevels(MGame mGame);

}