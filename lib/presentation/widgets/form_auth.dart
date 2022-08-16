/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:easy_localization/easy_localization.dart';
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
    RequiredValidator(errorText: 'auth_form_pass_req'.tr()),
    MinLengthValidator(8, errorText: 'auth_form_pass_big'.tr()),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'auth_form_pass_spec'.tr())
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
            valid: EmailValidator(errorText: "auth_form_email_wrong".tr()),
          ),
          InputTextField(
            mode: modeField.Auth,
            enabled: !sending,
            password: true,
            controller: widget.password,
            hint: "auth_form_pass".tr(),
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
