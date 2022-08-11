/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:drift/drift.dart';

@DataClassName('DBEGame')
class EGame extends Table{
  IntColumn get id => integer().autoIncrement().nullable()();
  IntColumn get level => integer()();
  IntColumn get star => integer()();
  IntColumn get user_id => integer()();
  BoolColumn get sync => boolean().nullable()();
}