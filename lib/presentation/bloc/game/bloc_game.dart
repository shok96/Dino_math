/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 05.08.2022, 20:01
 *
 */

import 'dart:async';
import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_game.freezed.dart';

class BlocGame extends Bloc<BlocGameEvent, BlocGameState> {
  UCGame _game;

  BlocGame(this._game) : super(BlocGameState.idle()) {
    on<BlocGameEvent>((event, emit) {
      event.when(startLevel: () {
        _game.genLevel();
      }, nextExample: () {
        emit(BlocGameState.example(_game.getExample()));
      }, checkExample: (example, answer) {
        if (_game.checkExample(example, answer))
          emit(BlocGameState.example(_game.getExample()));
        else
          emit(BlocGameState.gameOver());
      });
    });
  }
}

@freezed
class BlocGameEvent with _$BlocGameEvent {
  const factory BlocGameEvent.startLevel() = _StartLevel;

  const factory BlocGameEvent.nextExample() = _NextExample;

  const factory BlocGameEvent.checkExample(MMath example, int answer) =
      _CheckExample;
}

@freezed
class BlocGameState with _$BlocGameState {
  const factory BlocGameState.idle() = _IdleState;

  const factory BlocGameState.example(MLevelSession example) = _Examle;

  const factory BlocGameState.gameOver() = _GameOver;
}
