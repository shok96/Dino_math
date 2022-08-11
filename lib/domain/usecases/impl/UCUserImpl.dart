/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:40
 *
 */

import 'dart:math';

import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MExample.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:dino_solver/domain/usecases/intf/UCLevel.dart';
import 'package:dino_solver/domain/usecases/intf/UCMathSolver.dart';
import 'package:dino_solver/domain/usecases/intf/UCUser.dart';

class UCUserImpl extends UCUser {

  UserRepository userRepository;

  UCUserImpl(this.userRepository);

  @override
  void setUser(MUser user) {
    userRepository.setUser(user);
  }

}
