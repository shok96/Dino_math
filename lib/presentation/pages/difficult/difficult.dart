/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 18:32
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/presentation/pages/levels/levels.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Difficult extends StatelessWidget {
  const Difficult({Key? key}) : super(key: key);

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
                  Text("Выбери уровень сложности", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.red),),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomButton(text: "Школьник", action: (){
                          Utils.routerScreen(context, Levels());
                        }, color: ConstColors.lightGrown, color_text: ConstColors.lightGrownBorder, full_width: true),
                        SizedBox(height: 35.h,),
                        CustomButton(text: "Студент", action: (){}, color: ConstColors.lightGrown, color_text: ConstColors.lightGrownBorder,full_width: true),
                        SizedBox(height: 35.h,),
                        CustomButton(text: "Профессор", action: (){}, color: ConstColors.lightGrown, color_text: ConstColors.lightGrownBorder,full_width: true),
                      ],
                    ),
                  ),
                  Spacer(),
                  Image.asset(LocalImages.ads),
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
