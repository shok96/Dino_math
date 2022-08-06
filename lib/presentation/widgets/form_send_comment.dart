/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 31.07.2022, 15:54
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'button_submit.dart';
import 'input_text_field.dart';

class FormSendComment extends StatefulWidget {
  FormSendComment(
      {Key? key,
      required this.body,
      required this.name,
      required this.email,
      required this.action})
      : super(key: key);

  TextEditingController email;
  TextEditingController name;
  TextEditingController body;

  Function(_FormSendCommentState state) action;

  @override
  State<FormSendComment> createState() => _FormSendCommentState();
}

class _FormSendCommentState extends State<FormSendComment> {
  final _formKey = GlobalKey<FormState>();

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
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Отправить комментарий"),
          InputTextField(
            enabled: !sending,
            controller: widget.email,
            hint: "email",
            valid: EmailValidator(errorText: "Не корректный email"),
          ),
          InputTextField(
            enabled: !sending,
            controller: widget.name,
            hint: "name",
            valid: RequiredValidator(errorText: 'Пустое поле'),
          ),
          InputTextField(
            enabled: !sending,
            controller: widget.body,
            hint: "body",
            valid: RequiredValidator(errorText: 'Пустое поле'),
          ),
          SizedBox(
            height: 15.h,
          ),
          ButtonSubmit(
            loading: sending,
            text: 'Отправить',
            action: () {
              if (_formKey.currentState!.validate()) {
                widget.action(this);
              }
            },
          )
        ],
      ),
    );
  }
}
