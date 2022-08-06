/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 05.08.2022, 20:05
 *
 */

import 'dart:math';

import 'package:dino_solver/data/models/MExample.dart';
import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:dino_solver/domain/usecases/intf/UCMathSolver.dart';

class UCGameImpl extends UCGame {
  UCMathSolver _mathSolver;

  List<MMath> _listExample = <MMath>[];

  int _counter = 0;

  UCGameImpl(this._mathSolver);

  void _clear() {
    _listExample.clear();
    _counter = 0;
  }

  @override
  List<MMath> genLevel() {
    _clear();
    for (var i = 0; i < 10; i++) {
      _listExample.add(_mathSolver.genLevel1());
    }
    _counter == _listExample.length;
    return _listExample;
  }

  MExample _genExample(MMath example) {
    final lRes = [
      getRandomAnswers(example),
      getRandomAnswers(example),
      getRandomAnswers(example),
      example.answer
    ]..shuffle();
    return MExample(
        example: example,
        r1: lRes[0],
        r2: lRes[1],
        r3: lRes[2],
        r4: lRes[3],
        r: lRes);
  }

  int getRandomAnswers(MMath example) {
    final random = Random(DateTime.now().hashCode);
    var res = random.nextInt(example.complexity);
    if (res == example.answer) res += random.nextInt(example.complexity);
    return res;
  }

  @override
  MLevelSession getExample() {
    final res = _listExample[_counter];
    final _currentCounter = _counter;
    if ((_counter) < _listExample.length) {
      _counter++;
    }
    return MLevelSession(
        task: _genExample(res),
        currentIndex: _currentCounter,
        lengthExample: _listExample.length);
  }

  bool _checkAnswer(int answer, int question) {
    return answer == question;
  }

  bool _hasExample() => ((_counter) < _listExample.length);

  @override
  bool checkExample(MMath example, int answer) {
    final _check = _checkAnswer(answer, example.answer);
    return _hasExample();
  }
}
