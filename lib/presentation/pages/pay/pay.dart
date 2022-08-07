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
import 'package:dino_solver/presentation/pages/levels/levels.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/custom_pay_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pay extends StatelessWidget {
  const Pay({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w, bottom: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(LocalImages.dino7),
                  SizedBox(height: 32.h,),
                  Text("Вы согласны отписаться от рекламы?", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.red, fontSize: 15.sp),),
                  SizedBox(height: 16.h,),
                  CustomPayButton(text: "Преобрести подписку на 1 месяц без рекламы", action: (){}, color: ConstColors.lightGrown, color_text: ConstColors.lightGrownBorder, coast: 1),
                  SizedBox(height: 16.h,),
                  CustomPayButton(text: "преобрести подписку без рекламы навсегда", action: (){}, color: ConstColors.lightGrown, color_text: ConstColors.lightGrownBorder, coast: 3),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
