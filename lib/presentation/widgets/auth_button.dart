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

class AuthButton extends StatelessWidget {
  VoidCallback action;
  String text;
  bool loading;
  Color fillColor;

  AuthButton(
      {Key? key,
      required this.action,
      required this.text,
      this.loading = false, required this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
      child: GestureDetector(
        onTap: () {
          if (!loading) action();
        },
        child: Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
              color: fillColor,
              borderRadius: BorderRadius.circular(12.r)),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ),
                loading
                    ? SizedBox(
                        width: 16.w,
                      )
                    : SizedBox.shrink(),
                loading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
