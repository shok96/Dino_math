/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:dino_solver/core/common/colors.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:dino_solver/core/common/utils.dart';
import 'package:dino_solver/presentation/bloc/auth/auth_cubit.dart';
import 'package:dino_solver/presentation/pages/welcome/welcome.dart';
import 'package:dino_solver/presentation/widgets/auth_button.dart';
import 'package:dino_solver/presentation/widgets/button_switch_lang.dart';
import 'package:dino_solver/presentation/widgets/form_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum modeAuth { Login, Reg }

class AuthPage extends StatefulWidget {
  modeAuth mode;

  AuthPage({Key? key, this.mode = modeAuth.Login}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  late modeAuth mode;

  @override
  void didChangeDependencies() {
    mode = widget.mode;
    super.didChangeDependencies();
  }

  final _email_controller = TextEditingController();

  final _password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email_controller.text.trim(),
            password: _password_controller.text.trim());
      } on FirebaseAuthException catch (e) {
        Utils.toast(context, e.message ?? "");
      }
    }

    Future signUp() async {
      try {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email_controller.text.trim(),
            password: _password_controller.text.trim());

        if (user.user != null) {
          Utils.routerScreenDeleteStack(context, Welcome());
        } else {
          Utils.toast(context, "auth_error_reg".tr());
        }
      } on FirebaseAuthException catch (e) {
        Utils.toast(context, e.message ?? "");
      }
    }

    void anonymus(){
      context.read<AuthCubit>().signAnonymus();
      Utils.routerScreenDeleteStack(context, Welcome());
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            LocalImages.fon,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks8),
            right: 0,
            top: 0,
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks9),
            left: 0,
            top: ScreenUtil().screenHeight * 0.2,
          ),
          Positioned(
            child: Image.asset(LocalImages.cloaks7),
            left: 0,
            bottom: 0,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(LocalImages.dino),
                    Text(
                      "auth_how_name".tr(),
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    FormAuth(
                        formKey: _formKey,
                        password: _password_controller,
                        email: _email_controller,
                        action: (call) => AuthButton(
                            fillColor: ConstColors.green,
                            loading: loading,
                            action: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                if (mode == modeAuth.Login) {
                                  await signIn();
                                } else {
                                  await signUp();
                                }
                                setState(() {
                                  loading = false;
                                });
                              }
                            },
                            text: mode == modeAuth.Login ? "auth_i_know_login".tr() : "auth_i_need_reg".tr())),
                    AuthButton(
                        fillColor: ConstColors.green,
                        action: () {
                          setState(() {
                            if (mode == modeAuth.Login)
                              mode = modeAuth.Reg;
                            else
                              mode = modeAuth.Login;
                          });
                        },
                        text:
                        mode == modeAuth.Login ? "auth_i_need_reg".tr() : "auth_write_contact".tr()),
                    AuthButton(
                      fillColor: ConstColors.red,
                        action: () {
                          anonymus();
                        },
                        text: "auth_anonym".tr()),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ButtonSwitchLang(ModeLang.Russian),
                ButtonSwitchLang(ModeLang.English),
              ],
            ),
            left: 8.w,
            top: 30.h,
          ),
        ],
      ),
    );
  }
}
