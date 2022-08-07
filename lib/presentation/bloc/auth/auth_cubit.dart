/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {

 StreamSubscription<User?>? auth;

  AuthCubit() : super(AuthCubitState()) {
    auth = FirebaseAuth.instance.authStateChanges().listen((event) => emit(event == null
        ? AuthCubitState.LogOut()
        : AuthCubitState.LogIn(event)));
  }

  @override
  Future<void> close() {
    auth?.cancel();
    return super.close();
  }
}
