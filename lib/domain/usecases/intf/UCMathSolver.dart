
/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 03.08.2022, 23:08
 *
 */


import 'package:dino_solver/data/models/MMath.dart';

abstract class UCMathSolver {

  MMath genLevel1();
  MMath genLevel2();
  MMath genLevel3();
  MMath genLevel4();
  MMath genLevel5();

}