/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/repository.dart';
import 'package:dino_solver/domain/usecases/intf/UCUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_math_fork/ast.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  StreamSubscription<User?>? auth;

  late UCUser _user;
  late Repository _repository;

  AuthCubit(UCUser user, Repository repository) : super(AuthCubitState()) {
    _repository = repository;
    _user = user;
    auth = FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        emit(AuthCubitState.LogOut());
      } else {
        final user = MUser.Google(name: event.email!, id: event.uid);
        _user.setUser(user);
        _repository.firestoreDataSource.setUserDoc();
        emit(AuthCubitState.LogIn(user));
      }
    });
  }

  void signAnonymus() {
    final anonymusUser = MUser(id: 1, name: "Demon", modeUser: ModeUser.anonymus());
    _user.setUser(anonymusUser);
    emit(AuthCubitState.Anonymus(anonymusUser));
  }

  @override
  Future<void> close() {
    auth?.cancel();
    return super.close();
  }
}
