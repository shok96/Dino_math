/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 31.07.2022, 16:26
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  VoidCallback action;
  String text;
  bool loading;

  AuthButton(
      {Key? key,
      required this.action,
      required this.text,
      this.loading = false})
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
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12.r)),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
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
