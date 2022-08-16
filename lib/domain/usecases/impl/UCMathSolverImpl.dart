/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:29
 *
 */

import 'dart:math';

import 'package:dino_solver/data/models/MDifficult.dart';
import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/domain/usecases/intf/UCMathSolver.dart';

class UCMathSolverImpl extends UCMathSolver {
  Random random = Random();
  MDifficult _difficult = MDifficult.easy();

  UCMathSolverImpl();

  @override
  void setDifficult(MDifficult difficult) {
    _difficult = difficult;
  }

  int _getDifficult(){
    return _difficult.when(easy: () => 1, medium: () => 2, hard: () => 3);
  }

  void _genSeed() {
    random = Random(DateTime.now().hashCode);
  }

  @override
  MMath genLevel1() {
    _genSeed();
    final complexity = 10 + _getDifficult() * 5;
    final currentLevel = 1;
    final a = random.nextInt(complexity + currentLevel);
    final b = random.nextInt(complexity + currentLevel);
    final c = a + b;
    return MMath(question: "$a + $b", answer: c, complexity: complexity);
  }

  @override
  MMath genLevel2() {
    _genSeed();
    final complexity = 10 + _getDifficult() * 5;
    final currentLevel = 2;
    final a = random.nextInt(complexity + currentLevel);
    final b = random.nextInt(complexity + currentLevel);
    final c = a - b;
    return MMath(question: "$a - $b", answer: c, complexity: complexity);
  }

  @override
  MMath genLevel3() {
    _genSeed();
    final complexity = 10 + _getDifficult() * 5;
    final currentLevel = 3;
    final a = random.nextInt(complexity + currentLevel);
    final b = random.nextInt(complexity) + 1;
    final c = a * b;
    return MMath(question: "$a * $b", answer: c, complexity: complexity);
  }

  @override
  MMath genLevel4() {
    _genSeed();
    final complexity = 10 + _getDifficult() * 5;
    final currentLevel = 4;
    var a = random.nextInt(complexity + currentLevel);
    final b = [2, 4, 6, 8];
    final mno = b[random.nextInt(b.length)];
    a = a * mno;
    final c = a / mno;
    print("$a / $mno");
    return MMath(question: "\\frac {$a} {$mno}", answer: c.toInt(), complexity: complexity);
  }

  @override
  MMath genLevel5() {
    _genSeed();
    final complexity = 10 + _getDifficult() * 5;
    final currentLevel = 5;
    final a = random.nextInt(complexity + currentLevel);
    final b = random.nextInt(complexity + currentLevel);
    final d = random.nextInt(complexity + currentLevel);
    switch (random.nextInt(2)) {
      case 0:
        final c = a - b + d;
        return MMath(question: "$a - $b + $d", answer: c, complexity: complexity);
      case 1:
        final c = a + b - d;
        return MMath(question: "$a + $b - $d", answer: c, complexity: complexity);
      default:
        final c = a - b + d;
        return MMath(question: "$a - $b + $d", answer: c, complexity: complexity);
    }
  }

  @override
  MMath genLevel6() {
    _genSeed();
    final complexity = 10 + _getDifficult() * 5;
    final currentLevel = 5;
    final a = random.nextInt(complexity + currentLevel);
    final b = random.nextInt(complexity + currentLevel);
    final d = random.nextInt(complexity + currentLevel);
    switch (random.nextInt(2)) {
      case 0:
        final c = a * b + d;
        return MMath(question: "$a * $b + $d", answer: c, complexity: complexity);
      case 1:
        final c = a * b - d;
        return MMath(question: "$a * $b - $d", answer: c, complexity: complexity);
      default:
        final c = a * b + d;
        return MMath(question: "$a * $b + $d", answer: c, complexity: complexity);
    }
  }

  @override
  MMath genLevel7() {
    _genSeed();
    final complexity = 10 + _getDifficult() * 5;
    final currentLevel = 5;
    final a = random.nextInt(complexity + currentLevel);
    final b = random.nextInt(complexity + currentLevel);
    final d = random.nextInt(complexity + currentLevel);
    switch (random.nextInt(2)) {
      case 0:
        final c = a - b * d;
        return MMath(question: "$a - $b * $d", answer: c, complexity: complexity);
      case 1:
        final c = a + b * d;
        return MMath(question: "$a + $b * $d", answer: c, complexity: complexity);
      default:
        final c = a *- b * d;
        return MMath(question: "$a - $b * $d", answer: c, complexity: complexity);
    }
  }

  @override
  MMath genLevel8() {
    _genSeed();
    switch (random.nextInt(4)) {
      case 0:
        return genLevel1();
      case 1:
        return genLevel3();
      case 2:
        return genLevel5();
      case 3:
        return genLevel7();
      default:
        return genLevel1();
    }
  }

  @override
  MMath genLevel9() {
    _genSeed();
    switch (random.nextInt(4)) {
      case 0:
        return genLevel2();
      case 1:
        return genLevel4();
      case 2:
        return genLevel6();
      case 3:
        return genLevel8();
      default:
        return genLevel1();
    }
  }

  @override
  MMath genLevel10() {
    _genSeed();
    final complexity = 10 + _getDifficult() * 5;
    final currentLevel = 3;
    final a = random.nextInt(complexity + currentLevel);
    final c = a * a;
    return MMath(question: "\\sqrt{$c}", answer: a, complexity: complexity);
  }

}
