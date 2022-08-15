/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:29
 *
 */

import "package:freezed_annotation/freezed_annotation.dart";

part 'MGame.freezed.dart';

part 'MGame.g.dart';

@freezed
class MGame with _$MGame {
  const MGame._();

  const factory MGame(
      {required int level,
      int? id,
        bool? sync,
      required int star,
      required int user_id}) = _MGame;

  factory MGame.fromJson(Map<String, dynamic> json) => _$MGameFromJson(json);
}
