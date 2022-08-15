/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';

class FireStoreController {
  late FirebaseFirestore _db;

  FirebaseFirestore get store => _db;

  FireStoreController() {
    _initDB();
  }

  void _initDB() async {
    _db = FirebaseFirestore.instance;
  }

  Future<MTaskResult<T>> asyncResult<T>(Future<T?>? obj,
      {bool Null = false}) async {
    try {
      var res = await obj;
      if (res == null && Null)
        return MTaskResult.createFailureFireStore(error: "Null object");
      if(obj is Future<void>)
        return MTaskResult.createEmptyData(true, ModeSourceData.firestore());
      return MTaskResult.createBlankFireStore(res!, true);
    } catch (e) {
      switch (e.runtimeType) {
        // case DioError:
        default:
          return MTaskResult.createFailureFireStore(error: "error database");
      }
    }
  }

  Future<MTaskResult<T>> asyncResultSuper<T>(
      Future<dynamic>? Function() methodAction, T Function(dynamic data) serializes, {bool Null = false}) async {
    try {

      var res = await methodAction();
      if (res == null && Null)
        return MTaskResult.createFailureFireStore(error: "Null object");
      if(methodAction is Future<void>)
        return MTaskResult.createEmptyData(true, ModeSourceData.firestore());

      var resultSerializes = serializes(res);

      return MTaskResult.createBlankFireStore(resultSerializes!, true);


    } catch (e) {
      print("server_api_error - $e");
      switch (e.runtimeType) {
      // case DioError:
        default:
          return MTaskResult.createFailureFireStore(error: "error database");
      }
    }
    return MTaskResult.createFailureNetwork(error: "Empty object");
  }
}
