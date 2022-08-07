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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';

class ExampleContainer extends StatelessWidget {
  String text;

  final texViewStyle = TeXViewStyle(
      margin: TeXViewMargin.only(top: 16.h.round(), bottom: 16.h.round()),
      backgroundColor: ConstColors.whiteTransparent,
      borderRadius: TeXViewBorderRadius.all(20.r.round()),
      padding: TeXViewPadding.only(
          top: 12.r.round(),
          bottom: 12.h.round(),
          left: 16.w.round(),
          right: 16.w.round()));

  ExampleContainer(
      {Key? key,
        required this.text,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TeXView(
        style: TeXViewStyle(
            textAlign: TeXViewTextAlign.Center),
        loadingWidgetBuilder: (context) =>
            CircularProgressIndicator(),
        renderingEngine:
        TeXViewRenderingEngine.mathjax(),
        child: TeXViewColumn(children: [
          TeXViewContainer(
              child: TeXViewMarkdown(
                  text,
                  style: TeXViewStyle(
                      fontStyle: TeXViewFontStyle(
                          fontSize: 30),
                      contentColor:
                      ConstColors.black)),
              style: texViewStyle),
        ]));
  }
}