/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 15.08.2022, 22:26
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 15.08.2022, 22:26
 *
 */
import 'package:dino_solver/core/common/images.dart';
import 'package:flutter/widgets.dart';

class Ads extends StatelessWidget{

  bool show;

  Ads({this.show = false});

  @override
  Widget build(BuildContext context) {
    return show ? Image.asset(LocalImages.ads) : SizedBox.shrink();
  }

}
