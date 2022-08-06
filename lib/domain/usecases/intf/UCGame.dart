
/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 05.08.2022, 20:01
 *
 */


import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';

abstract class UCGame {

  List<MMath> genLevel();
  MLevelSession getExample();
  bool checkExample(MMath example, int answer);

}