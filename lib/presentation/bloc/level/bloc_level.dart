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
import 'package:dino_solver/domain/usecases/intf/UCLevel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_level.freezed.dart';

class BlocLevel extends Bloc<BlocLevelEvent, BlocLevelState> {
  UCLevel level;

  BlocLevel(this.level) : super(BlocLevelState.idle()) {
    on<BlocLevelEvent>((event, emit) async {
      await event.when(refresh: () async {
        final levels = await level.getLevels();
        if (levels.isSuccessfull) {
          emit(BlocLevelState.levels(levels.body!.length > 0
              ? [
                  ...levels.body!,
                  MGame(level: levels.body!.length + 1, star: 0, user_id: 1)
                ]
              : [MGame(level: 1, star: 0, user_id: 1)]));
        }
      }, save: (MGame mGame) async {
        final result = await level.saveLevels(mGame);
        if (result.isSuccessfull) {
          add(BlocLevelEvent.refresh());
        }
      }, sync: () {
        level.syncFireSotre();
      });
    });
  }
}

@freezed
class BlocLevelEvent with _$BlocLevelEvent {
  const factory BlocLevelEvent.refresh() = _RefreshEvent;

  const factory BlocLevelEvent.sync() = _SyncEvent;

  const factory BlocLevelEvent.save(MGame mGame) = _SaveEvent;
}

@freezed
class BlocLevelState with _$BlocLevelState {
  const factory BlocLevelState.idle() = _IdleState;

  const factory BlocLevelState.levels(List<MGame> levels) = _LevelsState;
}
