/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
      textTheme: GoogleFonts.rocknRollOneTextTheme(Theme.of(context).textTheme)
          .copyWith(
              bodyText2: GoogleFonts.rocknRollOne(
                  color: ConstColors.black, fontSize: 21.sp)));
}
