/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 08.08.2022, 22:48
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 08.08.2022, 22:48
 *
 */

import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:flutter/material.dart';

class RateLevel extends StatelessWidget{

  List<MMath> wrong;

  RateLevel(this.wrong);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          wrong.length < 7 ? LocalImages.star_on :LocalImages.star_off,
          scale: 2,
        ),
        Image.asset(
          wrong.length < 3 ? LocalImages.star_on :LocalImages.star_off,
          scale: 1,
        ),
        Image.asset(
          wrong.length == 0 ? LocalImages.star_on :LocalImages.star_off,
          scale: 2,
        ),
      ],
    );
  }

}