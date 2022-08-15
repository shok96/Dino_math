/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:40
 *
 */

import 'dart:math';

import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MExample.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/data/models/MLevelSession.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/domain/repository/repository.dart';
import 'package:dino_solver/domain/usecases/intf/UCGame.dart';
import 'package:dino_solver/domain/usecases/intf/UCMathSolver.dart';

class UCGameImpl extends UCGame {
  UCMathSolver _mathSolver;

  late Repository _repository;

  List<MMath> _listExample = <MMath>[];

  List<MMath> _listExampleWrong = <MMath>[];

  int _currentLevel = 1;
  int? _id_level = null;

  late MLevelSession _currentExample;

  int _counter = 0;

  UCGameImpl(this._mathSolver, this._repository){
    print(1);
  }

  @override
  List<MMath> nextLevel(MDifficult difficult) {
    _currentLevel++;
    return genLevel(_currentLevel, difficult);
  }

  @override
  List<MMath> restartLevel(MDifficult difficult) {
    return genLevel(_currentLevel, difficult);
  }

  void _clear() {
    //if (_id_level != null) _id_level = null;
    _listExample.clear();
    _listExampleWrong.clear();
    _counter = 0;
  }

  MMath _getLevelByQuery(int level) {
    switch (level) {
      case 1:
        return _mathSolver.genLevel1();
      case 2:
        return _mathSolver.genLevel2();
      case 3:
        return _mathSolver.genLevel3();
      case 4:
        return _mathSolver.genLevel4();
      case 5:
        return _mathSolver.genLevel5();
      default:
        return _mathSolver.genLevel1();
    }
  }

  @override
  List<MMath> genLevel(int level, MDifficult difficult, {int? id}) {
    _currentLevel = level;
    _clear();
    if (id != null) {
      _id_level = id;
    }
    _mathSolver.setDifficult(difficult);
    for (var i = 0; i < 10; i++) {
      _listExample.add(_getLevelByQuery(level));
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
    _currentExample = MLevelSession(
        currentLevel: _currentLevel,
        task: _genExample(res),
        currentIndex: _currentCounter,
        lengthExample: _listExample.length);
    return _currentExample;
  }

  bool _checkAnswer(int answer, int question) {
    return answer == question;
  }

  bool _hasExample() => ((_counter) < _listExample.length);

  @override
  bool checkExample(MMath example, int answer) {
    final _check = _checkAnswer(answer, example.answer);
    if (!_check) {
      _listExampleWrong.add(example);
    }
    return _hasExample();
  }

  @override
  List<MMath> getWrong() {
    return _listExampleWrong;
  }

  @override
  MLevelSession getCurrentExample() {
    return _currentExample;
  }

  int _calcStars() {
    if (_listExampleWrong.length <= 0)
      return 3;
    else if (_listExampleWrong.length <= 3)
      return 2;
    else if (_listExampleWrong.length <= 7)
      return 1;
    else
      return 0;
  }

  @override
  MGame getEndGame() {
    return MGame(
        id: _id_level,
        level: _currentLevel,
        star: _calcStars(),
        user_id: _repository.userRepository.getUser().id);
  }

  @override
  void setIdLevel(int? id) {
    if (id != null) {
      _id_level = id;
    }
  }
}
