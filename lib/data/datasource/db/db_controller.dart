/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */


import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';

import 'DB.dart';

class DBController{

  AppDatabase _db;

  AppDatabase get store => _db;

  DBController(this._db){
    _initDB();
  }


  void _initDB() async{
  }

  Future<MTaskResult<T>> asyncResult<T>(Future<T?>? obj, {bool Null = false}) async{
    try {
      var res = await obj;
      if(res == null && Null)
        return MTaskResult.createFailureCache(error: "Null object");
      return MTaskResult.createBlankCache(res!, true);
    }
    catch (e) {
      switch (e.runtimeType) {
      // case DioError:
        default:

          return MTaskResult.createFailureCache(error:  "error database");

      }
    }
  }



}