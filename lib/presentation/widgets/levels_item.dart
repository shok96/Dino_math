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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelsItem extends StatelessWidget {
  String text;
  bool active;
  int index;
  int star;
  int? id;

  LevelsItem(
      {Key? key,
        this.id,
      required this.text,
      this.active = true,
      required this.index,
      this.star = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        active
            ? Utils.routerScreen(
                context,
                BlocProvider<BlocLevel>.value(
                  value: BlocProvider.of<BlocLevel>(context),
                  child: Game(
                    id: id,
                    levels: index,
                  ),
                ))
            : null;
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                color:
                    active ? ConstColors.red : ConstColors.red.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: ConstColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  star >= 1 ? LocalImages.star_on : LocalImages.star_off,
                  scale: 3,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Image.asset(
                  star >= 2 ? LocalImages.star_on : LocalImages.star_off,
                  scale: 3,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Image.asset(
                  star >= 3 ? LocalImages.star_on : LocalImages.star_off,
                  scale: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
