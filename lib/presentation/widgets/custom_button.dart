/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 20:31
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function() action;
  Color color;
  Color color_text;
  bool full_width;

  CustomButton(
      {Key? key,
      required this.text,
      required this.action,
      required this.color,
      this.full_width = false,
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
          child: full_width
              ? Center(
                  child: _Text(
                  text: text,
                  color_text: color_text,
                ))
              : _Text(text: text, color_text: color_text),
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
          ?.copyWith(color: color_text, fontSize: 23.sp),
    );
  }
}
