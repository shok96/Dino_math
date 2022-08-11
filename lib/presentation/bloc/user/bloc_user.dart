/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:41
 *
 */

import 'dart:async';
import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_user.freezed.dart';

class BlocUser extends Bloc<BlocUserEvent, BlocUserState> {

  BlocUser() : super(BlocUserState.idle()) {
    on<BlocUserEvent>((event, emit) {

    });
  }
}

@freezed
class BlocUserEvent with _$BlocUserEvent {
  const factory BlocUserEvent.startLevel() = _StartLevelEvent;

}

@freezed
class BlocUserState with _$BlocUserState {
  const factory BlocUserState.idle() = _IdleState;

}
