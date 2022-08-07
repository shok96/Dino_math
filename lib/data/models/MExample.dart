/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
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