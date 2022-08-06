/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 21:07
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:dino_solver/presentation/bloc/game/bloc_game.dart';
import 'package:dino_solver/presentation/pages/win/win.dart';
import 'package:dino_solver/presentation/widgets/bloc_proxy.dart';
import 'package:dino_solver/presentation/widgets/button_answer_action.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:dino_solver/di.dart' as di;

class Game extends StatelessWidget {
  Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProxy<BlocGame>(
        bloc: (context, bloc) => BlocGame(di.sl<UCGame>()),
        child: _GameScreen());
  }
}

class _GameScreen extends StatefulWidget {
  _GameScreen({Key? key}) : super(key: key);

  @override
  State<_GameScreen> createState() => _GameState();
}

class _GameState extends State<_GameScreen> {

  late BlocGame blocGame;

  final texViewStyle = TeXViewStyle(
      margin: TeXViewMargin.only(top: 16.h.round(), bottom: 16.h.round()),
      backgroundColor: ConstColors.whiteTransparent,
      borderRadius: TeXViewBorderRadius.all(20.r.round()),
      padding: TeXViewPadding.only(
          top: 12.r.round(),
          bottom: 12.h.round(),
          left: 16.w.round(),
          right: 16.w.round()));

  @override
  void didChangeDependencies() {
    blocGame = context.read<BlocGame>();
    blocGame.add(BlocGameEvent.startLevel());
    blocGame.add(BlocGameEvent.nextExample());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    blocGame.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Text("Уровень"),
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(LocalImages.known),
                      Text(
                        "Как решать?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 10.sp),
                      )
                    ],
                  ),
                  Spacer(),
                  BlocBuilder<BlocGame, BlocGameState>(
                      builder: (context, state) => state.maybeWhen(
                            orElse: () => SizedBox.shrink(),
                            example: (data) => Text("${data.currentIndex+1}/${data.lengthExample}"),
                          )),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("+2"),
                          Image.asset(LocalImages.pen),
                        ],
                      ),
                      Text(
                        "Подсказка",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 10.sp),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              ProgressBar(
                duration: Duration(milliseconds: 3000),
                value: 0.5,
                height: 13,
                frColor: ConstColors.green,
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 10.r, color: ConstColors.gray),
                      borderRadius: BorderRadius.circular(25.r),
                      image: DecorationImage(
                          image: AssetImage(LocalImages.fon),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: BlocBuilder<BlocGame, BlocGameState>(
                      builder: (context, state) => state.maybeWhen(
                          orElse: () => SizedBox.shrink(),
                          example: (data) => Padding(
                                padding: EdgeInsets.all(30.r),
                                child: TeXView(
                                    style: TeXViewStyle(
                                        textAlign: TeXViewTextAlign.Center),
                                    loadingWidgetBuilder: (context) =>
                                        CircularProgressIndicator(),
                                    renderingEngine:
                                        TeXViewRenderingEngine.mathjax(),
                                    child: TeXViewColumn(children: [
                                      TeXViewContainer(
                                          child: TeXViewMarkdown(
                                              data.task.example.question,
                                              style: TeXViewStyle(
                                                  fontStyle: TeXViewFontStyle(
                                                      fontSize: 30),
                                                  contentColor:
                                                      ConstColors.black)),
                                          style: texViewStyle),
                                    ])),
                              )),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                      child: BlocBuilder<BlocGame, BlocGameState>(
                    builder: (context, state) => state.maybeWhen(
                        orElse: () => ButtonAnswerAction(),
                        example: (data) => ButtonAnswerAction(
                              example: data.task,
                            )),
                  )),
                ),
              ),
              CustomButton(
                  text: "Закончить игру",
                  action: () {
                    Utils.routerScreen(context, Win());
                  },
                  color: ConstColors.lightGrown,
                  color_text: ConstColors.lightGrownBorder),
            ],
          ),
        ),
      ),
    );
  }
}
