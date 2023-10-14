/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

import 'package:calacirya/calacirya.dart';
import 'package:calacirya/exception/login_exception.dart';
import 'package:flutter/material.dart';

abstract class BaseLoginPageModel extends StatefulWidget {
  const BaseLoginPageModel({Key? key}) : super(key: key);

  void logIn({
    required BuildContext context,
    required String username,
    required String password,
    Function(LoginException loginException)? onFailed,
  }) {
    Calacirya.instance.logIn(
      context: context,
      password: password,
      username: username,
      onFailed: onFailed ?? (LoginException loginException) => _alert(loginException, context),
    );
  }

  void _alert(LoginException loginException, BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(loginException.error),
          content: Text(loginException.message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void pushSignin(BuildContext context) => Calacirya.instance.completeWelcome(context);
}
