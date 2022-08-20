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
import 'package:dino_solver/presentation/pages/levels/levels.dart';
import 'package:dino_solver/presentation/widgets/ads.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/logout_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:dino_solver/di.dart" as di;

class Difficult extends StatelessWidget {
  const Difficult({Key? key}) : super(key: key);

  void setDifficult(BuildContext context, MDifficult difficult){
    context.read<UserRepository>().setDifficult(difficult);
    Utils.routerScreen(context, Levels());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                  width: double.infinity,
                  child:      Image.asset(
                    LocalImages.fon,
                    fit: BoxFit.cover,
                  ),),
             // Positioned(right:0, top: 50.h, child: LogoutWidget()),
              Positioned(left:10.w, top: 50.h, child: BackButton()),
            ],
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks8),
            right: 0,
            top: 0,
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks9),
            left: 0,
            top: ScreenUtil().screenHeight * 0.2,
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks7),
            left: 0,
            bottom: 0,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(LocalImages.dino3),
                  SizedBox(height: 32.h,),
                  Text("difficult_title".tr(), textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.red),),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomButton(text: "difficult_easy".tr(), action: (){
                         setDifficult(context, MDifficult.easy());
                        }, color: ConstColors.lightGrown, color_text: ConstColors.lightGrownBorder, full_width: true),
                        SizedBox(height: 35.h,),
                        CustomButton(text: "difficult_normal".tr(), action: (){
                          setDifficult(context, MDifficult.medium());
                        }, color: ConstColors.lightGrown, color_text: ConstColors.lightGrownBorder,full_width: true),
                        SizedBox(height: 35.h,),
                        CustomButton(text: "difficult_hard".tr(), action: (){
                          setDifficult(context, MDifficult.hard());
                        }, color: ConstColors.lightGrown, color_text: ConstColors.lightGrownBorder,full_width: true),
                      ],
                    ),
                  ),
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
