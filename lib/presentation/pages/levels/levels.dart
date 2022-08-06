/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 19:52
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/presentation/pages/game/game.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/levels_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Levels extends StatelessWidget {
  const Levels({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(LocalImages.star_on, scale: 2,),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text("0")
                    ],
                  ),
                  SizedBox(height: 32.h,),
                  Text("Шакальник", textAlign: TextAlign.center,),
                  SizedBox(height: 32.h,),
                  Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.r,
                      childAspectRatio: 4 / 2,
                      crossAxisSpacing: 20.r,
                      mainAxisSpacing: 20.r), itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        Utils.routerScreen(context, Game());
                      },
                      child: LevelsItem(text: "${index}",)), itemCount: 10,)),
                  SizedBox(height: 32.h,),
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
