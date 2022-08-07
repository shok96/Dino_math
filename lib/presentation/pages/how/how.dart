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
import 'package:dino_solver/presentation/pages/levels/levels.dart';
import 'package:dino_solver/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class How extends StatelessWidget {
  const How({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Padding(
              padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w, bottom: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(LocalImages.dino7),
                  SizedBox(height: 32.h,),
                  Text("Как решать?", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.red),),
                  SizedBox(height: 16.h,),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ConstColors.lightGrown,
                          border: Border.all(width: 5.r, color: ConstColors.grown),
                          borderRadius: BorderRadius.circular(25.r),
                          ),
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: SingleChildScrollView(
                          child: Text(
                            """С чего же начать?\n\n
Начните с самого простого уровня — сложения однозначных чисел, и доведите его до совершенства: 99% правильных ответов, на каждый ответ 1−2 секунды. Для решения примеров «с переходом через 10» попробуйте использовать следующую технику — «Опора на десяток».\n\n

Допустим, вам нужно сложить 8 и 7.\n\n

1) Спросите себя, сколько числу 8 не хватает до 10 (это 2).\n\n

2) Представьте 7 как сумму 2 и какого-то второго кусочка (это 5).\n\n

3) Прибавляйте к 8 сначала ту часть числа 7, которой недоставало до 10, а потом тот второй кусочек — получится 10 и 5, и это, конечно, 15.\n\n

Что насчет вычитания?\n\n
И здесь надо начинать с базового уровня — вычитания однозначного числа из чисел первого и второго десятка — и довести этот навык до совершенства. Как и в случае сложения, проблемы обычно возникают с вычитанием «с переходом через 10». И здесь поможет аналогичный способ «опоры на десяток».\n\n

Допустим, нам нужно из 12 вычесть 8.\n\n

1) Спросим себя, сколько нужно отнять от 12, чтобы получилось 10 (это 2).\n\n

2) Будем из 12 вычитать 8 по частям — сначала вычтем эту 2, а потом все остальное. А остальное — это сколько? (это 6).\n\n

3) После вычитания 2 из 12 мы получили 10, и нужно вычесть еще 6, получится 4. Готово!\n\n

    Как устроено умножение?\n\n
Начнем с умножения однозначных чисел. Для начала нужно вспомнить, что умножение — это когда несколько раз складывают одно и то же. Например, умножить 4 на 7 означает сложить четыре семерки. Пользуясь техникой сложения, мы можем легко посчитать — две семерки, 7 и 7, будет 14, если еще добавить третью 7, получится 21, и, добавляя последнюю, четвертую семерку, в результате получим 28.\n\n

Постепенно в результате тренировок вы запомните удобные вам опорные значения умножения и с их помощью сможете быстрее вычислять соседние. Например, если нужно умножить 6 на 7 (то есть, сложить шесть семерок), а вы помните, что 5 умножить на 7 (то есть, сложить пять семерок) будет 35, то чтобы получить итоговый результат, нужно просто добавить шестую семерку — получится 42.\n\n

Самым сложным примером в таблице умножения считается 7∙8. Для его запоминания есть неплохое мнемотехническое правило «пять шесть семь восемь», которое означает 56 = 7∙8.\n\n

    Осталось последнее только действие, деление?\n\n
Да, мы на финишной прямой. И снова начнем с самого простого уровня: деления на однозначное число тех чисел, которые знакомы нам по умножению однозначных.\n\n

Итак, что же такое деление? По сути, это «обратная» операция к умножению.\n\n

Например, разделить 56 на 7 — значит подобрать такое число, что если его умножить на 7, то получится 56. Поскольку вы к этому моменту уже хорошо ориентируетесь в таблице умножения, то наверняка вспомните, что именно 8, умноженное на 7, дает 56. Значит, искомое число — это 8, 56:7 = 8.\n\n

И так всегда — вспоминайте, какое число при умножении дает нужный результат — это и есть то число, которое вам нужно.\n\n"""
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
