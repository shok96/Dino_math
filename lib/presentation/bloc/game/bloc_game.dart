/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:41
 *
 */

import 'dart:async';
import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MGame.dart';
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
        startLevel: (level, difficult, id) {
          _game.genLevel(level, difficult, id: id);
          emit(BlocGameState.startLevel());
        },
        nextExample: () {
          emit(BlocGameState.example(_game.getExample()));
        },
        checkExample: (example, answer) {
          if (_game.checkExample(example, answer))
            emit(BlocGameState.example(_game.getExample()));
          else
            emit(BlocGameState.gameOver(
                _game.getWrong(), false, _game.getEndGame()));
        },
        gameOver: (time) => emit(
            BlocGameState.gameOver(_game.getWrong(), time, _game.getEndGame())),
        showHint: () {
          _game.showHint();
          emit(BlocGameState.hint(_game.getCurrentExample()));
        },
        restartLevel: (difficult) {
          _game.restartLevel(difficult);
          emit(BlocGameState.startLevel());
          emit(BlocGameState.example(_game.getExample()));
        },
        nextLevel: (MDifficult difficult) {
          _game.nextLevel(difficult);
          emit(BlocGameState.startLevel());
          emit(BlocGameState.example(_game.getExample()));
        },
      );
    });
  }
}

@freezed
class BlocGameEvent with _$BlocGameEvent {
  const factory BlocGameEvent.startLevel(int level, MDifficult difficult,
      {int? id}) = _StartLevelEvent;

  const factory BlocGameEvent.nextLevel(MDifficult difficult) = _NextLevelEvent;

  const factory BlocGameEvent.restartLevel(MDifficult difficult) =
      _RestartLevelEvent;

  const factory BlocGameEvent.nextExample() = _NextExampleEvent;

  const factory BlocGameEvent.checkExample(MMath example, int answer) =
      _CheckExampleEvent;

  const factory BlocGameEvent.gameOver({@Default(false) bool time}) =
      _GameOverEvent;

  const factory BlocGameEvent.showHint() = _ShowHintEvent;
}

@freezed
class BlocGameState with _$BlocGameState {
  const factory BlocGameState.idle() = _IdleState;

  const factory BlocGameState.startLevel() = _StartLevelState;

  const factory BlocGameState.example(MLevelSession example) = _ExamleState;

  const factory BlocGameState.hint(MLevelSession example) = _HintState;

  const factory BlocGameState.gameOver(
      List<MMath> wrongExample, bool time, MGame resultGame) = _GameOverState;
}
