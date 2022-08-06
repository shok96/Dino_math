/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 22:42
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
  }) = _MLevelSession;


}