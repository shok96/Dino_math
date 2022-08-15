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
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/domain/usecases/intf/UCLevel.dart';
import 'package:dino_solver/presentation/bloc/level/bloc_level.dart';
import 'package:dino_solver/presentation/pages/game/game.dart';
import 'package:dino_solver/presentation/widgets/ads.dart';
import 'package:dino_solver/presentation/widgets/bloc_proxy.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/levels_item.dart';
import 'package:dino_solver/presentation/widgets/logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dino_solver/di.dart' as di;
import 'package:collection/collection.dart';

class Levels extends StatelessWidget {
  Levels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LevelsScreen();
  }
}

class _LevelsScreen extends StatefulWidget {
  const _LevelsScreen({Key? key}) : super(key: key);

  @override
  State<_LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<_LevelsScreen> {
  String getDifficult(BuildContext context) {
    return context.read<UserRepository>().getDifficult().when(
        easy: () => "Школьник",
        medium: () => "Студент",
        hard: () => "Профессор");
  }

  @override
  void initState() {
    context.read<BlocLevel>().add(BlocLevelEvent.refresh());
    super.initState();
  }

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
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(
                              LocalImages.star_on,
                              scale: 2,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            BlocBuilder<BlocLevel, BlocLevelState>(
                              builder: (context, state) {
                                return state.when(
                                    idle: () => Text("0"),
                                    levels: (data) {
                                      int count = data.fold(
                                          0,
                                          (previousValue, element) =>
                                              previousValue + element.star);
                                      return Text("$count");
                                    });
                              },
                            )
                          ],
                        ),
                      ),
                      Positioned(right: 0, child: LogoutWidget()),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    getDifficult(context),
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
                                itemBuilder: (context, index) {
                                  final level = data.firstWhereOrNull(
                                      (element) => element.level == index + 1);
                                  if (level != null) {
                                    return LevelsItem(
                                        id: level.id,
                                        star: level.star,
                                        text: "${index + 1}",
                                        index: index + 1);
                                  } else {
                                    return LevelsItem(
                                      text: "${index + 1}",
                                      index: index + 1,
                                      active: false,
                                    );
                                  }
                                },
                                itemCount: 10,
                              ));
                    },
                  )),
                  SizedBox(
                    height: 32.h,
                  ),
                  Ads(),
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
