import 'dart:math';

import 'package:flutter/material.dart';

class GameControl {
  int foodCreater() {
    int randomNumber = Random().nextInt(800);

    return randomNumber;
  }

  int goRigth(int x) {
    if (x % 19 == 0 && x != 0) {
      return x - 20;
    } else {
      return x++;
    }
  }
}
