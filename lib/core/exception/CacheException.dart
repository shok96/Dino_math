/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 29.07.2022, 22:23
 *
 */

import 'BaseException.dart';

class CacheException extends BaseException{

  CacheException({required this.model});

  @override
  String toString() {
    return "code = ${this.code}, message = Cache error - ${this.model}";
  }

  @override
  int code = -10;

  String model;

}