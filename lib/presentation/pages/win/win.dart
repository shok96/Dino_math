/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 21:34
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/data/models/MRouteGame.dart';
import 'package:dino_solver/presentation/pages/game/game.dart';
import 'package:dino_solver/presentation/pages/lose/lose.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/example_container_wrong.dart';
import 'package:dino_solver/presentation/widgets/rate_level.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Win extends StatelessWidget {
  List<MMath> wrongExample;

  Win({Key? key, required this.wrongExample}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context);
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              LocalImages.fon,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 25.h, left: 16.w, right: 16.w, bottom: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          LocalImages.ads,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                   RateLevel(wrongExample),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "win_title".tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: ConstColors.red),
                    ),
                    wrongExample.length == 0
                        ? Expanded(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Spacer(),
                                Image.asset(LocalImages.dino6),
                                Spacer(),
                              ],
                            ),
                        )
                        : Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: ExampleContainerWrong(example: wrongExample),
                          ),
                        ),
                    CustomButton(
                        text: "next".tr(),
                        action: () {
                          Utils.routerPop(context, MRouteGame.nextLevel());
                        },
                        color: ConstColors.lightGrown,
                        color_text: ConstColors.lightGrownBorder),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
