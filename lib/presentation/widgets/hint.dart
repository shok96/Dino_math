/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 16.08.2022, 20:58
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 16.08.2022, 20:58
 *
 */

import 'package:dino_solver/core/common/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hint extends StatelessWidget{

  int hint;
  VoidCallback action;

  Hint(this.hint, this.action);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (hint > 0)
          action();
      },
      child: Column(
        children: [
          Row(
            children: [
              Text("+ ${hint}"),
              Image.asset(LocalImages.pen),
            ],
          ),
          Text(
            "game_hint_button".tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontSize: 10.sp),
          )
        ],
      ),
    );
  }


}