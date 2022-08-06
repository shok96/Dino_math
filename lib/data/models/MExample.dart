/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 22:42
 *
 */

import 'package:dino_solver/data/models/MMath.dart';
import "package:freezed_annotation/freezed_annotation.dart";

part 'MExample.freezed.dart';

@freezed
class MExample with _$MExample {

  const MExample._();

  const factory MExample({
    required MMath example,
    required int r1,
    required int r2,
    required int r3,
    required int r4,
    required List<int> r
  }) = _MExample;


}