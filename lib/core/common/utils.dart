/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/presentation/pages/splash/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Utils {
  static void routerScreen(BuildContext context, Widget child) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => child));
  }

  static void routerPop(BuildContext context, dynamic result) {
    Navigator.of(context).pop(result);
  }

  static Future routerScreenFuture(BuildContext context, Widget child) async{
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) => child));
  }

  static void routerScreenDeleteStack(BuildContext context, Widget child) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => child),
      (route) => false,
    );
  }

  static void routerScreenDeleteDoPageStack(BuildContext context, Widget child, RoutePredicate predicate) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => child),
          predicate,
    );
  }

  static void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(text),
    ));
  }

  static void logOut(BuildContext context) async{
        await FirebaseAuth.instance.signOut();
        routerScreenDeleteStack(context, Splash());
  }

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
