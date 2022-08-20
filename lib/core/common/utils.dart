/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/presentation/bloc/auth/auth_cubit.dart';
import 'package:dino_solver/presentation/bloc/auth/auth_state.dart';
import 'package:dino_solver/presentation/pages/splash/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  static void logOut(BuildContext context) async {
    if(FirebaseAuth.instance.currentUser != null){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('auth_exit_dialog_title'.tr()),
        content: Text('auth_exit_dialog_body'.tr()),
        actions: <Widget>[
          TextButton(
            onPressed: () async
    {
      await FirebaseAuth.instance.currentUser?.delete();
      Navigator.pop(context);
    },
            child: Text('auth_exit_dialog_button2'.tr()),
          ),
          TextButton(
            onPressed: () async{
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
    },
            child: Text('auth_exit_dialog_button1'.tr()),
          ),
        ],
      ),
    );}
    else {
      context.read<AuthCubit>().emit(AuthCubitState.LogOut());
      routerScreenDeleteStack(context, Splash());
    }
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
