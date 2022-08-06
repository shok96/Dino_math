/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 21:58
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 05.08.2022, 21:58
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/data/models/MExample.dart';
import 'package:dino_solver/presentation/bloc/game/bloc_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';

class ButtonAnswerAction extends StatelessWidget {
  MExample? example;

  ButtonAnswerAction({Key? key, this.example}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5 / 2,
          crossAxisSpacing: 20.r,
          mainAxisSpacing: 20.r,
          crossAxisCount: 2),
      itemBuilder: (context, index) => CustomButton(
          full_width: true,
          text: example != null ? example!.r[index].toString() : "?",
          action: () {
            if(example != null) {
              context.read<BlocGame>().add(BlocGameEvent.checkExample(example!.example, example!.r[index]));
            }
          },
          color: ConstColors.green),
      itemCount: 4,
    );
  }
}
