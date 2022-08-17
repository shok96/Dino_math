/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/domain/usecases/intf/UCLevel.dart';
import 'package:dino_solver/presentation/bloc/level/bloc_level.dart';
import 'package:dino_solver/presentation/pages/difficult/difficult.dart';
import 'package:dino_solver/presentation/pages/levels/levels.dart';
import 'package:dino_solver/presentation/widgets/ads.dart';
import 'package:dino_solver/presentation/widgets/bloc_proxy.dart';
import 'package:dino_solver/presentation/widgets/button_switch_lang.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/logout_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:dino_solver/di.dart" as di;

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _WelcomeScreen();
  }
}

class _WelcomeScreen extends StatefulWidget {
  const _WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<_WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<_WelcomeScreen> {

  @override
  void initState() {
    context.read<BlocLevel>().add(BlocLevelEvent.sync());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            LocalImages.fon,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Image.asset(LocalImages.graff),
            left: 0,
            top: ScreenUtil().screenHeight * 0.1,
          ),
          Positioned(
            child: Image.asset(LocalImages.coup),
            right: 0,
            bottom: 0,
          ),
          Positioned(
            child: Image.asset(LocalImages.dino2),
            left: 0,
            bottom: 0,
          ),
          Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ButtonSwitchLang(ModeLang.Russian),
                ButtonSwitchLang(ModeLang.English),
              ],
            ),
            right: 0,
            bottom: 0,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Text("menu_title".tr(), style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.red), textAlign: TextAlign.center,)),
                      Positioned(right:0, child: LogoutWidget()),
                    ],
                  ),
                  SizedBox(height: 32.h,),
                  Text("menu_title2".tr(), textAlign: TextAlign.center),
                  Spacer(),
                  CustomButton(text: "menu_game".tr(), action: (){
                    Utils.routerScreen(context, Difficult());
                  }, color: ConstColors.red,),
                  Spacer(),
                  Ads(),
                  SizedBox(height: 5.h,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
