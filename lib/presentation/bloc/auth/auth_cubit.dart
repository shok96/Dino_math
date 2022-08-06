/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 14:53
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
