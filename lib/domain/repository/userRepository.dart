/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository{

  void setUser(MUser user);
  MUser getUser();
  void setDifficult(MDifficult difficult);
  MDifficult getDifficult();

}