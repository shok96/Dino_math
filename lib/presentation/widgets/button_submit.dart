/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSubmit extends StatelessWidget {
  String text;
  VoidCallback action;
  bool loading;

  ButtonSubmit(
      {Key? key, required this.text, required this.action, this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!loading) action();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(25.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.white),
              ),
              loading
                  ? SizedBox(
                      width: 16.r,
                    )
                  : SizedBox.shrink(),
              loading ? CircularProgressIndicator(color: Colors.white,) : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
