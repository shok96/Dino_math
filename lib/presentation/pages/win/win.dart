/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 21:34
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/presentation/pages/game/game.dart';
import 'package:dino_solver/presentation/pages/lose/lose.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Win extends StatelessWidget {
  const Win({Key? key}) : super(key: key);

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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w, bottom: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(LocalImages.ads,),
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(LocalImages.star_off, scale: 2,),
                      Image.asset(LocalImages.star_off, scale: 1,),
                      Image.asset(LocalImages.star_off, scale: 2,),
                    ],
                  ),
                  SizedBox(height: 32.h,),
                  Text("Хорошо", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.red),),
                  Spacer(),
                  Image.asset(LocalImages.dino6),
                  Spacer(),
                  CustomButton(
                      text: "Продолжить",
                      action: () {
                       // Utils.routerScreen(context, Lose());
                      },
                      color: ConstColors.lightGrown,
                      color_text: ConstColors.lightGrownBorder),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
