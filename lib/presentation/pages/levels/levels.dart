/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/domain/usecases/intf/UCLevel.dart';
import 'package:dino_solver/presentation/bloc/level/bloc_level.dart';
import 'package:dino_solver/presentation/pages/game/game.dart';
import 'package:dino_solver/presentation/widgets/bloc_proxy.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/levels_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dino_solver/di.dart' as di;

class Levels extends StatelessWidget {
  Levels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProxy<BlocLevel>(
        bloc: (context, bloc) => BlocLevel(di.sl<UCLevel>())..add(BlocLevelEvent.refresh()),
        child: _LevelsScreen());
  }
}

class _LevelsScreen extends StatelessWidget {
  const _LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            LocalImages.fon,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks8),
            right: 0,
            top: 0,
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks9),
            left: 0,
            top: ScreenUtil().screenHeight * 0.2,
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks7),
            left: 0,
            bottom: 0,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        LocalImages.star_on,
                        scale: 2,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text("0")
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "Шакальник",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Expanded(child: BlocBuilder<BlocLevel, BlocLevelState>(
                    builder: (context, state) {
                      return state.when(
                          idle: () => SizedBox.shrink(),
                          levels: (data) => GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200.r,
                                        childAspectRatio: 4 / 2,
                                        crossAxisSpacing: 20.r,
                                        mainAxisSpacing: 20.r),
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                        onTap: () {
                                          Utils.routerScreen(
                                              context,
                                              Game(
                                                levels: index + 1,
                                              ));
                                        },
                                        child: LevelsItem(
                                          text: "${index + 1}",
                                        )),
                                itemCount: 10,
                              ));
                    },
                  )),
                  SizedBox(
                    height: 32.h,
                  ),
                  Image.asset(LocalImages.ads),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
