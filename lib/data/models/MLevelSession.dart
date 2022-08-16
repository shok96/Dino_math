/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/data/models/MExample.dart';
import 'package:dino_solver/data/models/MMath.dart';
import "package:freezed_annotation/freezed_annotation.dart";

part 'MLevelSession.freezed.dart';

@freezed
class MLevelSession with _$MLevelSession {

  const MLevelSession._();

  const factory MLevelSession({
    required MExample task,
    required int currentIndex,
    required int lengthExample,
    required int currentLevel,
    required int hint
  }) = _MLevelSession;


}