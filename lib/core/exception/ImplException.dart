
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'BaseException.dart';

class ImplException extends BaseException{

  ImplException({required this.model});

  @override
  String toString() {
    return "code = ${this.code}, message = Implementation not found into ${this.model}";
  }

  @override
  int code = -100;

  String model;

}