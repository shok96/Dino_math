
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:24
 *
 */


import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';

abstract class UCGame {

  void setIdLevel(int? id);
  List<MMath> genLevel(int level, MDifficult difficult, {int? id});
  List<MMath> restartLevel(MDifficult difficult);
  List<MMath> nextLevel(MDifficult difficult);
  MLevelSession getExample();
  MLevelSession getCurrentExample();
  bool checkExample(MMath example, int answer);
  List<MMath> getWrong();
  MGame getEndGame();

}