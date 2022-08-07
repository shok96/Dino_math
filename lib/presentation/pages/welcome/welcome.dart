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
import 'package:dino_solver/presentation/pages/difficult/difficult.dart';
import 'package:dino_solver/presentation/pages/levels/levels.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Привет", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.red),),
                  SizedBox(height: 32.h,),
                  Text("Прокачай свой мозг, решая задачки", textAlign: TextAlign.center),
                  Spacer(),
                  CustomButton(text: "Решать!", action: (){
                    Utils.routerScreen(context, Difficult());
                  }, color: ConstColors.red,),
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
