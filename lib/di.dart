/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 22:58
 *
 */

import 'package:dino_solver/domain/usecases/impl/UCGameImpl.dart';
import 'package:dino_solver/domain/usecases/impl/UCMathSolverImpl.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:dino_solver/domain/usecases/intf/UCMathSolver.dart';
import 'package:dino_solver/presentation/bloc/auth/auth_cubit.dart';
import 'package:dino_solver/presentation/bloc/game/bloc_game.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart' hide Headers;

import 'presentation/bloc/user/bloc_user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async{

  sl.registerFactory(() => AuthCubit());
 //  sl.registerFactory(() => ConnectiveCubit());
 //  sl.registerFactory(() => CubitBottomNav());
 //
  sl.registerFactory(() => BlocGame(sl()));
 //  sl.registerFactory(() => BlocPost(sl()));
 //  sl.registerFactory(() => BlocComment(sl()));
 //  sl.registerFactory(() => BlocAlbum(sl()));
 //  sl.registerFactory(() => BlocPhoto(sl()));
 //
  sl.registerLazySingleton<UCMathSolver>(() => UCMathSolverImpl());
  sl.registerLazySingleton<UCGame>(() => UCGameImpl(sl()));
 //  sl.registerLazySingleton<UCPost>(() => UCPostImpl(sl()));
 //  sl.registerLazySingleton<UCComment>(() => UCCommentImpl(sl()));
 //  sl.registerLazySingleton<UCAlbum>(() => UCAlbumImpl(sl()));
 //  sl.registerLazySingleton<UCPhoto>(() => UCPhotoImpl(sl()));
 //
 //  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remoteDataSource: sl(),  cacheDataSource: sl()));
 //
 //  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
 //  sl.registerLazySingleton<CacheDataSource>(() => CacheDataSourceImpl(sl()));
 // //
 //  sl.registerLazySingleton(() => Api(sl()));
 //
 //  sl.registerLazySingleton(() => Dio());
 // //
 //  sl.registerLazySingleton(() => NetController(sl()));
 //  sl.registerLazySingleton(() => DBController(sl()));
 // //
 //
 //  final database = AppDatabase();
 //  sl.registerLazySingleton(() => database);


}