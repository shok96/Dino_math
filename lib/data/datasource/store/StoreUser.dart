/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 08.08.2022, 17:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 08.08.2022, 17:02
 *
 */

import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreUser{

  late MUser user;
  MDifficult difficult = MDifficult.easy();

}