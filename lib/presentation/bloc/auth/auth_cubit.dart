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
import 'package:dino_solver/domain/usecases/intf/UCUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  StreamSubscription<User?>? auth;

  late UCUser _user;

  AuthCubit(UCUser user) : super(AuthCubitState()) {
    _user = user;
    auth = FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        emit(AuthCubitState.LogOut());
      } else {
        final user = MUser.Google(name: event.email!, id: event.uid);
        _user.setUser(user);
        emit(AuthCubitState.LogIn(user));
      }
    });
  }

  void signAnonymus() {
    final anonymusUser = MUser(id: 1, name: "Demon");
    _user.setUser(anonymusUser);
    emit(AuthCubitState.Anonymus(anonymusUser));
  }

  @override
  Future<void> close() {
    auth?.cancel();
    return super.close();
  }
}
