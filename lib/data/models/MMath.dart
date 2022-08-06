/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 22:42
 *
 */

import "package:freezed_annotation/freezed_annotation.dart";

part 'MMath.freezed.dart';

@freezed
class MMath with _$MMath {

  const MMath._();

  const factory MMath({
    required String question,
    required int answer,
    required int complexity
  }) = _MMath;


}