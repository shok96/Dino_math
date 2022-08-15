/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 21:33
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/data/models/MRouteGame.dart';
import 'package:dino_solver/presentation/pages/game/game.dart';
import 'package:dino_solver/presentation/pages/how/how.dart';
import 'package:dino_solver/presentation/pages/pay/pay.dart';
import 'package:dino_solver/presentation/widgets/ads.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lose extends StatelessWidget {
  Lose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context);
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: ConstColors.lose,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                child: Image.asset(LocalImages.caplya),
                left: 32.w,
                top: 32.h,
              ),
              Positioned(
                child: Image.asset(LocalImages.caplya),
                right: 32.w,
                top: 32.h,
              ),
              Positioned(
                child: Image.asset(LocalImages.caplya),
                right: 0,
                left: 0,
                top: ScreenUtil().screenHeight * 0.1,
              ),
              Positioned(
                child: Image.asset(LocalImages.caplya),
                left: 32.w,
                top: ScreenUtil().screenHeight * 0.5,
              ),
              Positioned(
                child: Image.asset(LocalImages.caplya),
                right: 32.w,
                top: ScreenUtil().screenHeight * 0.5,
              ),
              Positioned(
                child: Image.asset(LocalImages.caplya),
                left: 32.w,
                bottom: 0,
              ),
              Positioned(
                child: Image.asset(LocalImages.caplya),
                right: 32.w,
                bottom: 0,
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 75.h, left: 16.w, right: 16.w, bottom: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ну вот :(",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: ConstColors.loseText, fontSize: 30.sp),
                      ),
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(LocalImages.cloaks12))),
                          child: Padding(
                            padding: EdgeInsets.all(32.r),
                            child: Image.asset(LocalImages.dino5),
                          )),
                      Spacer(),
                      Text(
                        "Говорят, что у всех дорог есть конец, но иногда конец похож на начало, даже если ты прошел очень длинный путь(",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: ConstColors.white, fontSize: 15.sp),
                      ),
                      Spacer(),
                      CustomButton(
                          text: "Начать заново",
                          action: () {
                            Utils.routerPop(context, MRouteGame.restart());
                          },
                          color: ConstColors.lightGrown,
                          color_text: ConstColors.lightGrownBorder),
                      SizedBox(height: 32.h,),
                      Ads(),
                      SizedBox(height: 5.h,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
