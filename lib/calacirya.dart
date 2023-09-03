/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

library calacirya;

import 'package:calacirya/src/base_models/base_login_page_model.dart';
import 'package:calacirya/src/base_models/base_welcome_page_model.dart';
import 'package:calacirya/src/exceptions/calacirya_init_exception.dart';
import 'package:calacirya/src/exceptions/login_exception.dart';
import 'package:calacirya/src/extensions/navigation_manager_context_extension.dart';
import 'package:calacirya/src/page/login_example/login_example.dart';
import 'package:calacirya/src/page/welcome_example/welcome_example.dart';
import 'package:calacirya/src/shared_keys.dart';
import 'package:flutter/material.dart';
import 'package:mazarbul/mazarbul.dart';

class Calacirya {
  bool status = false;

  BaseWelcomePageModel? _baseWelcomeWidgetModel;
  BaseLoginPageModel? _baseLoginWidgetModel;
  Mazarbul? _mazarbul;

  static final Calacirya _calacirya = Calacirya._internal();

  factory Calacirya() => _calacirya;

  Calacirya._internal();

  Future<void> initCalacirya({
    var sharedInstance,
    bool welcomeStatus = false,
    bool autoLogin = false,
    BaseWelcomePageModel? baseWelcomeWidgetModel,
    BaseLoginPageModel? baseLoginWidgetModel,
  }) async {
    try {
      _mazarbul = Mazarbul.withSharedPreferences(sharedInstance ?? await Mazarbul().getSharedInstance());
      _baseWelcomeWidgetModel = baseWelcomeWidgetModel;
      _baseLoginWidgetModel = baseLoginWidgetModel;
      //todo : silinecek test için açık
      _mazarbul?.saveBool(SharedKeys.welcomeIsOpened, false);
      status = true;
    } on Exception {
      throw CalaciryaInitException();
    }
  }

  /// This function, `checkWelcome`, checks the state based on the values of
  /// [SharedKeys.welcomeStatus] and [SharedKeys.welcomeIsOpened].
  ///
  /// It returns `false` when [SharedKeys.welcomeStatus] is `true` and
  /// [SharedKeys.welcomeIsOpened] is also `true`. In all other cases, it returns `true`.
  bool checkWelcome() {
    // checkWelcome Scenarios:
    //  welcomeStatus | welcomeIsOpened |   State
    // -------------- | --------------- | -------
    //      true      |       true      |   false
    // -------------- | --------------- | -------
    //      true      |      false      |   true
    // -------------- | --------------- | -------
    //     false      |      true       |   false
    // -------------- | --------------- | -------
    //     false      |      false      |   false
    return _getBool(SharedKeys.welcomeStatus) && !_getBool(SharedKeys.welcomeIsOpened);
  }

  /// This function, `checkLogin`, checks the state based on the values of
  /// [SharedKeys.firstLogin] and [SharedKeys.autoLogin].
  ///
  /// It returns `true` when [SharedKeys.firstLogin] is `true` and
  /// [SharedKeys.autoLogin] is `true`. It returns `true` when [SharedKeys.firstLogin] is
  /// `true` and [SharedKeys.autoLogin] is `false`. It returns `false` when [SharedKeys.firstLogin]
  /// is `false` and [SharedKeys.autoLogin] is `true`. In all other cases, it returns `true`.
  bool checkLogin() {
    // checkLogin Scenarios:
    //  firstLogin  | autoLogin |   State
    // ------------ | --------- | -------
    //     true     |   true    |   true
    // ------------ | --------- | -------
    //     true     |   false   |   true
    // ------------ | --------- | -------
    //    false     |   true    |   false
    // ------------ | --------- | -------
    //    false     |   false   |   true
    return _getBool(SharedKeys.firstLogin) || !_getBool(SharedKeys.autoLogin);
  }

  /// This function returns a bool value using the [key] parameter, which is an
  /// entry from the [SharedKeys] enumeration.
  ///
  /// If [key] is null or matches [SharedKeys.firstLogin], the function returns `true`.
  /// Otherwise, if [key] matches [SharedKeys.welcomeStatus], it returns `false`. Otherwise, it still returns `false`.
  bool _getBool(SharedKeys key) {
    return _mazarbul?.getBool(key) ?? key == SharedKeys.firstLogin
        ? true
        : SharedKeys.welcomeStatus == key
            ? false
            : false;
  }

  void start(BuildContext context) {
    if (checkWelcome()) {
      _pushWelcome(context);
    } else if (checkLogin()) {
      _pushLogin(context);
    } else {
      //checAautologinpageasync ****();
    }
  }

  void completeWelcome(BuildContext context) {
    _mazarbul?.saveBool(SharedKeys.welcomeIsOpened, true);
    _pushLogin(context);
  }

  void _pushWelcome(BuildContext context) {
    context.nvgManager.pushR(_baseWelcomeWidgetModel ?? const WelcomeExample());
  }

  void _pushLogin(BuildContext context) {
    context.nvgManager.pushR(_baseLoginWidgetModel ?? const LoginExample());
  }

  void logIn({
    required BuildContext context,
    required String username,
    required String password,
    required Function(LoginException loginException) onFailed,
  }) {
    bool x = false;
    if (x == true) {
    } else {
      _mazarbul?.removeItem(SharedKeys.firstLogin);
      onFailed(LoginException(type: LoginExceptionType.unknown, message: "Bilinmeyen bir hata oluştu"));
    }
  }

  static Calacirya get instance => _calacirya.status ? _calacirya : throw CalaciryaInitException();
}
