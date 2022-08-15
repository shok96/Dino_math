/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

//
// import 'dart:convert';
//
// MTaskResult MTaskResultFromJson(String str) => MTaskResult.fromJson(json.decode(str));
//
// String MTaskResultToJson(MTaskResult data) => json.encode(data.toJson());
// class MTaskResult<T> {
//     bool isSuccessfull;
//     String? data;
//     String? error;
//     Map<String, dynamic>? json_data;
//     T? body;
//
//     String? getJsonData(String key){
//         try {
//            return json_data![key];
//         }
//         catch(e){
//             return data?.replaceAll("{", "").replaceAll("}", "");
//         }
//         return data;
//     }
//
//     MTaskResult({this.data, this.isSuccessfull = false, this.body, this.json_data, this.error});
//
//     factory MTaskResult.fromJson(Map<String, dynamic> json) {
//         return MTaskResult(
//             data: json['data'],
//             isSuccessfull: json['isSuccessfull'],
//             body: json['body'],
//             error: json['error'],
//         );
//     }
//
//     factory MTaskResult.createBlank(T data) {
//         return MTaskResult(
//             data: null,
//             isSuccessfull: true,
//             body: data,
//             error: null,
//         );
//     }
//
//     factory MTaskResult.createFailure({String? error = "null blank"}) {
//         return MTaskResult(
//             data: null,
//             isSuccessfull: false,
//             body: null,
//             error: error,
//         );
//     }
//
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['data'] = this.data;
//         data['isSuccessfull'] = this.isSuccessfull;
//         data['body'] = this.body;
//         data['error'] = this.error;
//         return data;
//     }
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'MTaskResult.freezed.dart';

part 'MTaskResult.g.dart';

@Freezed(genericArgumentFactories: true)
class MTaskResult<T> with _$MTaskResult<T> {
  const MTaskResult._();

  factory MTaskResult(
      {required bool isSuccessfull,
      String? data,
      String? error,
      Map<String, dynamic>? json_data,
      ModeSourceData? modeSourceData,
      T? body}) = _MTaskResult;

  factory MTaskResult.createBlank(T data, bool isSuccessfull) =>
      MTaskResult<T>(isSuccessfull: isSuccessfull, body: data);

  factory MTaskResult.createBlankNetwork(T data, bool isSuccessfull) =>
      MTaskResult<T>(isSuccessfull: isSuccessfull, body: data, modeSourceData: ModeSourceData.network());

  factory MTaskResult.createBlankCache(T data, bool isSuccessfull) =>
      MTaskResult<T>(isSuccessfull: isSuccessfull, body: data, modeSourceData: ModeSourceData.cache());

  factory MTaskResult.createBlankFireStore(T data, bool isSuccessfull) =>
      MTaskResult<T>(isSuccessfull: isSuccessfull, body: data, modeSourceData: ModeSourceData.firestore());

  factory MTaskResult.createEmptyData(bool isSuccessfull, ModeSourceData modeSourceData) =>
      MTaskResult<T>(isSuccessfull: isSuccessfull, modeSourceData: modeSourceData);

  factory MTaskResult.createFailure({@Default("null blank") String? error}) =>
      MTaskResult<T>(isSuccessfull: false, error: error);

  factory MTaskResult.createFailureNetwork({@Default("null blank") String? error}) =>
      MTaskResult<T>(isSuccessfull: false, error: error, modeSourceData: ModeSourceData.network());

  factory MTaskResult.createFailureCache({@Default("null blank") String? error}) =>
      MTaskResult<T>(isSuccessfull: false, error: error, modeSourceData: ModeSourceData.cache());

  factory MTaskResult.createFailureFireStore({@Default("null blank") String? error}) =>
      MTaskResult<T>(isSuccessfull: false, error: error, modeSourceData: ModeSourceData.firestore());

  factory MTaskResult.ModeDataSource(
          MTaskResult base, ModeSourceData modeSourceData) =>
      MTaskResult<T>(
          isSuccessfull: base.isSuccessfull,
          data: base.data,
          error: base.error,
          json_data: base.json_data,
          modeSourceData: modeSourceData,
          body: base.body);

  factory MTaskResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$MTaskResultFromJson<T>(json, fromJsonT);
}

@freezed
class ModeSourceData with _$ModeSourceData {
  const factory ModeSourceData.network() = _Network;

  const factory ModeSourceData.cache() = _Cache;

  const factory ModeSourceData.firestore() = _FireStore;

  factory ModeSourceData.fromJson(Map<String, dynamic> json) => _$ModeSourceDataFromJson(json);
}
