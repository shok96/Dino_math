/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'dart:async';

import 'package:dino_solver/core/themes/base_theme.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/presentation/bloc/auth/auth_cubit.dart';
import 'package:dino_solver/presentation/bloc/level/bloc_level.dart';
import 'package:dino_solver/presentation/bloc/user/bloc_user.dart';
import 'package:dino_solver/presentation/pages/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'di.dart' as di;
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runZonedGuarded<Future<void>>(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);

    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }

    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
        .then((_) => BlocOverrides.runZoned(
              () => runApp(const MyApp()),
              blocObserver: AppBlocObserver(),
            ));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (context) => di.sl<AuthCubit>()),
          BlocProvider<BlocUser>(create: (context) => di.sl<BlocUser>()),
          BlocProvider<BlocLevel>(create: (context) => di.sl<BlocLevel>()),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => di.sl<UserRepository>())
          ],
          child: ScreenUtilInit(
              designSize: Size(414, 896),
              builder: (BuildContext context, Widget? child) => MaterialApp(
                  theme: themeData(context),
                  title: 'Математика с Дино',
                  home: Splash())),
        ));
  }
}