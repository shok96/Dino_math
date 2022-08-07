/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:29
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