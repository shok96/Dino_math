/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:47
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleContainer extends StatelessWidget {
  String text;


  ExampleContainer(
      {Key? key,
        required this.text,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Math.tex(text, mathStyle: MathStyle.display, textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 30.sp));
  }
}