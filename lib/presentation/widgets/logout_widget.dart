/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 15.08.2022, 22:05
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 15.08.2022, 22:05
 *
 */

import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/presentation/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return IconCircle(icon: Icons.logout, action: () async{
      Utils.logOut(context);
    },);
  }

}