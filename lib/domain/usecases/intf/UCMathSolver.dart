
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */


import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MMath.dart';

abstract class UCMathSolver {

  void setDifficult(MDifficult difficult);
  MMath genLevel1();
  MMath genLevel2();
  MMath genLevel3();
  MMath genLevel4();
  MMath genLevel5();
  MMath genLevel6();
  MMath genLevel7();
  MMath genLevel8();
  MMath genLevel9();
  MMath genLevel10();
}