/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum modeField { Classic, Auth }

class InputTextField extends StatelessWidget {
  modeField mode;
  TextEditingController controller;
  String hint;
  String? Function(String? res)? valid;

  InputTextField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.valid,
      this.enabled = true,
      this.password = false,
      this.mode = modeField.Classic})
      : super(key: key);
  bool enabled;
  bool password;

  @override
  Widget build(BuildContext context) {
    return mode == modeField.Classic
        ? _ClassicField(controller: controller, hint: hint, password: password, enabled: enabled, valid: valid,)
        : _AuthField(controller: controller, hint: hint, password: password, enabled: enabled, valid: valid,);
  }
}

class _AuthField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String? Function(String? res)? valid;

  _AuthField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.valid,
      this.enabled = true,
      this.password = false})
      : super(key: key);
  bool enabled;
  bool password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
      child: TextFormField(
        controller: controller,
        obscureText: password,
        textInputAction: TextInputAction.next,
        validator: valid,
        decoration: InputDecoration(
          errorMaxLines: 2,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.deepPurple)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red)),
            hintText: hint,
            fillColor: Colors.grey[200],
            filled: true),
      ),
    );
  }
}

class _ClassicField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String? Function(String? res)? valid;

  _ClassicField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.valid,
      this.enabled = true,
      this.password = false})
      : super(key: key);
  bool enabled;
  bool password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
      child: Container(
        child: TextFormField(
          obscureText: password,
          validator: valid,
          enabled: enabled,
          textInputAction: TextInputAction.next,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.w),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide:
                    BorderSide(color: const Color(0xffdadada), width: 1)),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: const Color(0xff222222).withAlpha(76),
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                ),
          ),
        ),
      ),
    );
  }
}
