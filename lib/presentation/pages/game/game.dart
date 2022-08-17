/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:47
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MRouteGame.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:dino_solver/presentation/bloc/game/bloc_game.dart';
import 'package:dino_solver/presentation/bloc/level/bloc_level.dart';
import 'package:dino_solver/presentation/pages/how/how.dart';
import 'package:dino_solver/presentation/pages/lose/lose.dart';
import 'package:dino_solver/presentation/pages/win/win.dart';
import 'package:dino_solver/presentation/widgets/bloc_proxy.dart';
import 'package:dino_solver/presentation/widgets/button_answer_action.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:dino_solver/presentation/widgets/example_container.dart';
import 'package:dino_solver/presentation/widgets/hint.dart';
import 'package:dino_solver/presentation/widgets/progress_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dino_solver/di.dart' as di;

class Game extends StatelessWidget {
  int? id;
  int levels;

  Game({Key? key, required this.levels, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProxy<BlocGame>(
        bloc: (context, bloc) => BlocGame(di.sl<UCGame>()),
        child: _GameScreen(
          id: id,
          levels: levels,
        ));
  }
}

class _GameScreen extends StatefulWidget {
  int levels;
  int? id;

  _GameScreen({Key? key, required this.levels, this.id}) : super(key: key);

  @override
  State<_GameScreen> createState() => _GameState();
}

class _GameState extends State<_GameScreen> {
  GlobalKey<ProgressBarState> _globalKeyProgressBar = GlobalKey();

  late BlocGame blocGame;
  late BlocLevel blocLevel;
  late UserRepository userRepository;

  @override
  void didChangeDependencies() {
    blocGame = context.read<BlocGame>();
    blocLevel = context.read<BlocLevel>();
    userRepository = context.read<UserRepository>();
    super.didChangeDependencies();
    blocGame.add(BlocGameEvent.startLevel(
        widget.levels, userRepository.getDifficult(),
        id: widget.id));
    blocGame.add(BlocGameEvent.nextExample());
    blocGame.stream.listen((event) {
      event.maybeWhen(
          orElse: () {},
          startLevel: () => Future.delayed(Duration(seconds: 1),
              () => _globalKeyProgressBar.currentState?.start()),
          gameOver: (data, time, gameResult) {
            _globalKeyProgressBar.currentState?.stop();
            if (gameResult.star > 0 && !time)
              blocLevel.add(BlocLevelEvent.save(gameResult));
            Utils.routerScreenFuture(
                    context,
                    time
                        ? Lose()
                        : (data.length > 7
                            ? Lose()
                            : Win(
                                wrongExample: data,
                              )))
                .then((value) {
              if (value is MRouteGameRestart)
                _restart();
              else if (value is MRouteGameNextLevel) _nextLevel();
            });
          });
    });
  }

  @override
  void dispose() {
    blocGame.close();
    _globalKeyProgressBar.currentState?.stop();
    _globalKeyProgressBar.currentState?.dispose();
    super.dispose();
  }

  void _restart() {
    blocGame.add(BlocGameEvent.restartLevel(userRepository.getDifficult()));
  }

  void _nextLevel() {
    blocGame.add(BlocGameEvent.nextLevel(userRepository.getDifficult()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              BlocBuilder<BlocGame, BlocGameState>(
                builder: (context, state) => state.maybeWhen(
                  orElse: () => SizedBox.shrink(),
                  example: (data) => Text("game_title".tr()+"${data.currentLevel}"),
                  hint: (data) => Text("game_title".tr()+"${data.currentLevel}"),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Utils.routerScreen(context, How());
                    },
                    child: Column(
                      children: [
                        Image.asset(LocalImages.known),
                        Text(
                          "game_how_button".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 10.sp),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  BlocBuilder<BlocGame, BlocGameState>(
                      builder: (context, state) => state.maybeWhen(
                            orElse: () => SizedBox.shrink(),
                            example: (data) => Text(
                                "${data.currentIndex + 1}/${data.lengthExample}"),
                            hint: (data) => Text(
                                "${data.currentIndex + 1}/${data.lengthExample}"),
                          )),
                  Spacer(),
                  BlocBuilder<BlocGame, BlocGameState>(
                      builder: (context, state) => state.maybeWhen(
                            orElse: () => SizedBox.shrink(),
                            example: (data) => Hint(data.hint, () => blocGame.add(BlocGameEvent.showHint())),
                            hint: (data) => Hint(data.hint, () => blocGame.add(BlocGameEvent.showHint())),
                          )),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              ProgressBar(
                key: _globalKeyProgressBar,
                duration: 40,
                frColor: ConstColors.green,
                onFinish: () {
                  blocGame.add(BlocGameEvent.gameOver(time: true));
                },
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
                                child: ExampleContainer(
                                    text: data.task.example.question),
                              ),
                          hint: (data) => Padding(
                                padding: EdgeInsets.all(30.r),
                                child: ExampleContainer(
                                    text: data.task.example.question),
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
                            ),
                        hint: (data) => ButtonAnswerAction(
                              example: data.task,
                              hint: true,
                            )),
                  )),
                ),
              ),
              CustomButton(
                  text: "game_end_button".tr(),
                  action: () {
                    Navigator.of(context).pop();
                    // Utils.routerScreen(context, Win());
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
