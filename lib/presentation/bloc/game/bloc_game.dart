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

part 'bloc_game.freezed.dart';

class BlocGame extends Bloc<BlocGameEvent, BlocGameState> {
  UCGame _game;

  BlocGame(this._game) : super(BlocGameState.idle()) {
    on<BlocGameEvent>((event, emit) {
      event.when(
          startLevel: () {
            _game.genLevel();
            emit(BlocGameState.startLevel());
          },
          nextExample: () {
            emit(BlocGameState.example(_game.getExample()));
          },
          checkExample: (example, answer) {
            if (_game.checkExample(example, answer))
              emit(BlocGameState.example(_game.getExample()));
            else
              emit(BlocGameState.gameOver(_game.getWrong()));
          },
          gameOver: () => emit(BlocGameState.gameOver(_game.getWrong())),
          showHint: () => emit(BlocGameState.hint(_game.getCurrentExample())),
      );
    });
  }
}

@freezed
class BlocGameEvent with _$BlocGameEvent {
  const factory BlocGameEvent.startLevel() = _StartLevelEvent;

  const factory BlocGameEvent.nextExample() = _NextExampleEvent;

  const factory BlocGameEvent.checkExample(MMath example, int answer) =
      _CheckExampleEvent;

  const factory BlocGameEvent.gameOver() = _GameOverEvent;

  const factory BlocGameEvent.showHint() = _ShowHintEvent;
}

@freezed
class BlocGameState with _$BlocGameState {
  const factory BlocGameState.idle() = _IdleState;

  const factory BlocGameState.startLevel() = _StartLevelState;

  const factory BlocGameState.example(MLevelSession example) = _ExamleState;

  const factory BlocGameState.hint(MLevelSession example) = _HintState;

  const factory BlocGameState.gameOver(List<MMath> wrongExample) =
      _GameOverState;
}
