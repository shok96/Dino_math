/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/domain/usecases/intf/UCApp.dart';
import 'package:dino_solver/presentation/bloc/auth/auth_cubit.dart';
import 'package:dino_solver/presentation/bloc/auth/auth_state.dart';
import 'package:dino_solver/presentation/pages/auth/auth_page.dart';
import 'package:dino_solver/presentation/pages/welcome/welcome.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:dino_solver/di.dart" as di;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: Future.delayed(Duration(seconds: 3), () => true),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return BlocBuilder<AuthCubit, AuthCubitState>(
              builder: (context, state) {
                return state.when(
                  () => Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  // LogIn: (user) => Base(),
                  // LogOut: () => AuthPage());
                  LogIn: (user) => Welcome(),
                  LogOut: () => AuthPage(), Anonymus: (user) => Welcome(),
                );
              },
            );
          } else {
            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    child: Image.asset(LocalImages.cloaks2),
                    left: 0,
                    top: 0,
                  ),
                  Positioned(
                    child: Image.asset(LocalImages.cloaks5),
                    right: 0,
                    top: 30.h,
                  ),
                  Positioned(
                    child: Image.asset(LocalImages.cloaks4),
                    right: 0,
                    top: ScreenUtil().screenHeight * 0.4,
                  ),
                  Positioned(
                    child: Image.asset(LocalImages.cloaks3),
                    left: 0,
                    top: ScreenUtil().screenHeight * 0.45,
                  ),
                  Positioned(
                    child: Image.asset(LocalImages.cloaks6),
                    left: 0,
                    bottom: 0,
                  ),
                  Positioned(
                    child: Image.asset(LocalImages.cloaks1),
                    right: 0,
                    bottom: 0,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("splash1".tr()),
                      Image.asset(LocalImages.dino),
                      Text("splash2".tr()),
                    ],
                  ),
                  Positioned(child: Text(di.sl<UCApp>().getVersion(), textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey),), bottom: 30.h, left: 0, right: 0,),
                ],
              ),
            );
          }
        });
  }
}
