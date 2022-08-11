/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'button_submit.dart';
import 'input_text_field.dart';

class FormAuth extends StatefulWidget {

  GlobalKey<FormState> formKey;

  FormAuth(
      {Key? key,
        required this.formKey,
      required this.password,
      required this.email,
      required this.action})
      : super(key: key);

  TextEditingController email;
  TextEditingController password;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Пароль обязателен'),
    MinLengthValidator(8, errorText: 'Пароль должен быть больше или равно 8 символов'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Пароль должен иметь хотябы 1 спецсимвол')
  ]);

  Widget Function(_FormAuthState state) action;

  @override
  State<FormAuth> createState() => _FormAuthState();
}

class _FormAuthState extends State<FormAuth> {

  bool sending = false;

  void loading() {
    setState(() {
      sending = true;
    });
  }

  void idle() {
    setState(() {
      sending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InputTextField(
            mode: modeField.Auth,
            enabled: !sending,
            controller: widget.email,
            hint: "email",
            valid: EmailValidator(errorText: "Не корректный email"),
          ),
          InputTextField(
            mode: modeField.Auth,
            enabled: !sending,
            password: true,
            controller: widget.password,
            hint: "Пароль",
            valid: widget.passwordValidator,
          ),
          SizedBox(
            height: 15.h,
          ),
          widget.action(this)
        ],
      ),
    );
  }
}
