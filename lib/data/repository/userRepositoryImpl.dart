/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */
import 'package:dino_solver/data/datasource/store/StoreUser.dart';
import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/presentation/pages/difficult/difficult.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl extends UserRepository {
  StoreUser _storeUser;

  UserRepositoryImpl(this._storeUser);

  @override
  MDifficult getDifficult() {
    return _storeUser.difficult;
  }

  @override
  MUser getUser() {
    return _storeUser.user;
  }

  @override
  void setDifficult(MDifficult difficult) {
    _storeUser.difficult = difficult;
  }

  @override
  void setUser(MUser user) {
    _storeUser.user = user;
  }
}
