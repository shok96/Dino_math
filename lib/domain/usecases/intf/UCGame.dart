
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:24
 *
 */


import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';

abstract class UCGame {

  List<MMath> genLevel();
  MLevelSession getExample();
  MLevelSession getCurrentExample();
  bool checkExample(MMath example, int answer);
  List<MMath> getWrong();

}