
/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 29.07.2022, 22:23
 *
 */

import 'BaseException.dart';

class UnknownException extends BaseException{

  UnknownException();

  @override
  String toString() {
    return "code = ${this.code}, message = Unknown error";
  }

  @override
  int code = -900;

}