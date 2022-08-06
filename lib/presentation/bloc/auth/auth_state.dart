/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 14:50
 *
 */

import "package:freezed_annotation/freezed_annotation.dart";
import "package:firebase_auth/firebase_auth.dart";

part  'auth_state.freezed.dart';

@freezed
class AuthCubitState with _$AuthCubitState{

  const factory AuthCubitState.LogIn(User user) = _LogIn;
  const factory AuthCubitState.LogOut() = _LogOut;
  const factory AuthCubitState() = _AuthCubitState;

}
