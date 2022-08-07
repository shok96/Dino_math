/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:29
 *
 */

import 'dart:math';

import 'package:dino_solver/data/models/MMath.dart';
import 'package:dino_solver/domain/usecases/intf/UCMathSolver.dart';

class UCMathSolverImpl extends UCMathSolver {
  Random random = Random();

  UCMathSolverImpl();

  void _genSeed() {
    random = Random(DateTime.now().hashCode);
  }

  @override
  MMath genLevel1() {
    _genSeed();
    final complexity = 10 + 2 * 5;
    final a = random.nextInt(complexity + 0);
    final b = random.nextInt(complexity + 0);
    final c = a + b;
    return MMath(question: "$a + $b", answer: c, complexity: complexity);
  }

  @override
  MMath genLevel2() {
    _genSeed();
    final complexity = 10 + 2 * 5;
    final a = random.nextInt(10 + 2 * 5 + 0);
    final b = random.nextInt(10 + 2 * 5 + 0);
    final c = a - b;
    return MMath(question: "$a - $b", answer: c, complexity: complexity);
  }

  @override
  MMath genLevel3() {
    _genSeed();
    final complexity = 10 + 2 * 5;
    final a = random.nextInt(10 + 2 * 5 + 0);
    final b = random.nextInt(10 + 2 * 5) + 1;
    final c = a * b;
    return MMath(question: "$a * $b", answer: c, complexity: complexity);
  }

  @override
  MMath genLevel4() {
    _genSeed();
    final complexity = 10 + 2 * 5;
    var a = random.nextInt(10 + 2 * 5 + 0);
    final b = [2, 4, 6, 8];
    final mno = b[random.nextInt(b.length)];
    a = a * mno;
    final c = a / mno;
    return MMath(question: "$a / $b", answer: c.toInt(), complexity: complexity);
  }

  @override
  MMath genLevel5() {
    _genSeed();
    final complexity = 10 + 2 * 5;
    final a = random.nextInt(10 + 2 * 5 + 0);
    final b = random.nextInt(10 + 2 * 5 + 0);
    final d = random.nextInt(10 + 2 * 5 + 0);
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
}
