/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  NavigationManager get nvgManager => NavigationManager(this);
}

class NavigationManager {
  BuildContext context;

  NavigationManager(this.context);

  void pushR(Widget newPage) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => newPage));
  }

  void push(Widget newPage) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => newPage));
  }

  void pop() {
    Navigator.of(context).pop();
  }
}
