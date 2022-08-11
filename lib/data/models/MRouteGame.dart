/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:29
 *
 */

import 'package:firebase_auth/firebase_auth.dart';
import "package:freezed_annotation/freezed_annotation.dart";

part 'MRouteGame.freezed.dart';

@freezed
class MRouteGame with _$MRouteGame {

  const factory MRouteGame.restart() = MRouteGameRestart;
  const factory MRouteGame.nextLevel() = MRouteGameNextLevel;

}