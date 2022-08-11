/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:29
 *
 */

import "package:freezed_annotation/freezed_annotation.dart";

part 'MUser.freezed.dart';

@freezed
class MUser with _$MUser {

  const MUser._();

  const factory MUser({
    required String name,
    required int id,
  }) = _MUser;

  factory MUser.Google({
    required String name,
    required String id,
  }) => MUser(name: name, id: id.hashCode);

}
