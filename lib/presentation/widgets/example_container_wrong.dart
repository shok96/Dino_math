/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:47
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ExampleContainerWrong extends StatelessWidget {
  List<MMath> example;

  ExampleContainerWrong(
      {Key? key,
        required this.example,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: genTextView(context, example),
      ),
    );
  }

  List<Widget> genTextView(BuildContext context, List<MMath> example){
    return example.map((e) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Math.tex(e.question, mathStyle: MathStyle.display, textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 30.sp)),
    )).toList();
  }
}