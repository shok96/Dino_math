/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 20:00
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? frColor;
  final double? borderRaius;
  final double? value;
  Duration? duration;

  ProgressBar(
      {Key? key,
        this.duration,
        this.width,
        this.height,
        this.bgColor,
        this.frColor,
        this.borderRaius,
        this.value=1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    //debugPrint(MediaQuery.of(context).size.width.toString());
    return Container(
        // width: width ?? w,
        height: height ?? 12.h,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              // width: width ?? w,
              height: height ?? 12.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(height ?? 6.r)),
                  color: bgColor ?? ConstColors.lightGrown),
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
               return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(height ?? 6.r)),
                      //color: frColor ?? Colors.blue
                gradient: frColor == null ? LinearGradient(colors: [
                  ConstColors.green,
                ]) : null,
                    color: frColor ?? null
                  ),
                  child: new AnimatedContainer(
                    duration: duration != null ? duration! : Duration(milliseconds: 0),
                    width:
                    width != null && height != null && value != null ? (value! *
                        width!) / height! : (value! * constraints.maxWidth),
                  ),
                );
              }
            ),
          ],
        ));
  }


}
