/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPayButton extends StatelessWidget {
  String text;
  Function() action;
  Color color;
  Color color_text;
  bool full_width;
  int coast;

  CustomPayButton(
      {Key? key,
      required this.text,
      required this.action,
      required this.color,
      this.full_width = false,
      required this.coast,
      this.color_text = ConstColors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            border:
                Border.all(color: ConstColors.lightGrownBorder, width: 2.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          child: Column(
            children: [
              full_width
                  ? Center(
                      child: _Text(
                      text: text,
                      color_text: color_text,
                    ))
                  : _Text(text: text, color_text: color_text),
              SizedBox(height: 8.h,),
              Text("${coast}\$", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 30.sp, color: ConstColors.red),)
            ],
          ),
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  String text;
  Color color_text;

  _Text({Key? key, required this.text, required this.color_text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          ?.copyWith(color: color_text, fontSize: 16.sp),
    );
  }
}
