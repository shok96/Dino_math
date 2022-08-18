/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/data/datasource/db/CacheDataSource.dart';
import 'package:dino_solver/data/datasource/db/DB.dart';
import 'package:dino_solver/data/datasource/db/db_controller.dart';
import 'package:dino_solver/data/datasource/firestore/FireStoreDataSource.dart';
import 'package:dino_solver/data/datasource/firestore/firestore_controller.dart';
import 'package:dino_solver/data/datasource/store/StoreUser.dart';
import 'package:dino_solver/data/repository/repositoryImpl.dart';
import 'package:dino_solver/data/repository/userRepositoryImpl.dart';
import 'package:dino_solver/domain/repository/repository.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/domain/usecases/impl/UCAppImpl.dart';
import 'package:dino_solver/domain/usecases/impl/UCGameImpl.dart';
import 'package:dino_solver/domain/usecases/impl/UCLevelImpl.dart';
import 'package:dino_solver/domain/usecases/impl/UCMathSolverImpl.dart';
import 'package:dino_solver/domain/usecases/impl/UCUserImpl.dart';
import 'package:dino_solver/domain/usecases/intf/UCApp.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:dino_solver/domain/usecases/intf/UCLevel.dart';
import 'package:dino_solver/domain/usecases/intf/UCMathSolver.dart';
import 'package:dino_solver/domain/usecases/intf/UCUser.dart';
import 'package:dino_solver/presentation/bloc/auth/auth_cubit.dart';
import 'package:dino_solver/presentation/bloc/game/bloc_game.dart';
import 'package:dino_solver/presentation/bloc/level/bloc_level.dart';
import 'package:dino_solver/presentation/bloc/user/bloc_user.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:package_info_plus/package_info_plus.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AuthCubit(sl(), sl()));
  //  sl.registerFactory(() => ConnectiveCubit());
  //  sl.registerFactory(() => CubitBottomNav());
  //
  sl.registerFactory(() => BlocGame(sl()));
  sl.registerFactory(() => BlocLevel(sl()));
  sl.registerFactory(() => BlocUser());
  //  sl.registerFactory(() => BlocPost(sl()));
  //  sl.registerFactory(() => BlocComment(sl()));
  //  sl.registerFactory(() => BlocAlbum(sl()));
  //  sl.registerFactory(() => BlocPhoto(sl()));
  //
  sl.registerLazySingleton<UCMathSolver>(() => UCMathSolverImpl());
  sl.registerLazySingleton<UCGame>(() => UCGameImpl(sl(), sl()));
  sl.registerLazySingleton<UCUser>(() => UCUserImpl(sl()));
  sl.registerLazySingleton<UCLevel>(() => UCLevelImpl(sl()));
  sl.registerLazySingleton<UCApp>(() => UCAppImpl());
  //  sl.registerLazySingleton<UCPost>(() => UCPostImpl(sl()));
  //  sl.registerLazySingleton<UCComment>(() => UCCommentImpl(sl()));
  //  sl.registerLazySingleton<UCAlbum>(() => UCAlbumImpl(sl()));
  //  sl.registerLazySingleton<UCPhoto>(() => UCPhotoImpl(sl()));
  //
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(userRepository: sl(),  cacheDataSource: sl(), firestoreDataSource: sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  //
  //  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
   sl.registerLazySingleton<CacheDataSource>(() => CacheDataSourceImpl(sl()));
   sl.registerLazySingleton<FireStoreDataSource>(() => FireStoreDataSourceImpl(sl()));
  //
  //
  //
  sl.registerLazySingleton<StoreUser>(() => StoreUser());
  // //
  //  sl.registerLazySingleton(() => Api(sl()));
  //
  //  sl.registerLazySingleton(() => Dio());
  // //
  //  sl.registerLazySingleton(() => NetController(sl()));
   sl.registerLazySingleton(() => DBController(sl()));
   sl.registerLazySingleton(() => FireStoreController());
  // //
  //
   final database = AppDatabase();
   sl.registerLazySingleton(() => database);

  sl<UCApp>().initPackageInfo(await PackageInfo.fromPlatform());
}
