/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 19:09
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelsItem extends StatelessWidget {
  String text;

  LevelsItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: ConstColors.red,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
              child: Text(text, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.white), textAlign: TextAlign.center,),
            ),
          ),
          SizedBox(height: 8.h,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(LocalImages.star_off, scale: 3,),
              SizedBox(width: 8.w,),
              Image.asset(LocalImages.star_off, scale: 3,),
              SizedBox(width: 8.w,),
              Image.asset(LocalImages.star_off, scale: 3,),
            ],
          )
        ],
      ),
    );
  }
}
