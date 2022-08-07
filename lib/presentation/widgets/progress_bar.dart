/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 21:22
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatefulWidget {
  final Color? bgColor;
  final Color? frColor;
  final Gradient? grColor;
  final Duration duration;
  VoidCallback onFinish;

  ProgressBar(
      {Key? key,
      required this.duration,
      this.bgColor,
      this.frColor,
      this.grColor,
      required this.onFinish})
      : super(key: key);

  @override
  State<ProgressBar> createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addStatusListener((status) {
        print(status);
        if(status == AnimationStatus.completed){
          widget.onFinish();
        }
      });
    super.initState();
  }

  void start() {
    controller.stop();
    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 12.h,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 12.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  color: widget.bgColor ?? ConstColors.lightGrown),
            ),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    gradient: widget.grColor,
                    color: widget.frColor),
                child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, snapshot) {
                      return Container(
                        width: (animation.value * constraints.maxWidth),
                      );
                    }),
              );
            }),
          ],
        ));
  }
}
