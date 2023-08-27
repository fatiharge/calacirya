library calacirya;

import 'package:calacirya/src/calacirya_init_exception.dart';
import 'package:calacirya/src/shared_keys.dart';
import 'package:flutter/material.dart';
import 'package:mazarbul/mazarbul.dart';

import 'src/base_welcome_widget_model.dart';

class Calacirya {
  static final Calacirya _calacirya = Calacirya._internal();
  bool status = false;
  Mazarbul? _mazarbul;
  bool _welcomeStatus = false;
  bool _welcomeIsOpened = false;
  bool _autoLogin = false;
  bool _firstLogin = false;
  BaseWelcomeWidgetModel? baseWelcomeWidgetModel;

  factory Calacirya() => _calacirya;

  Calacirya._internal();

  Future<void> initCalacirya({var sharedInstance}) async {
    try {
      _mazarbul = Mazarbul.withSharedPreferences(sharedInstance ?? await Mazarbul().getSharedInstance());
      sharedInit();
      status = true;
    } on Exception {
      throw CalaciryaInitException();
    }
  }

  void sharedInit() {
    _welcomeStatus = _mazarbul?.getBool(SharedKeys.welcomeStatus) ?? false;
    _welcomeIsOpened = _mazarbul?.getBool(SharedKeys.welcomeIsOpened) ?? false;
    _autoLogin = _mazarbul?.getBool(SharedKeys.autoLogin) ?? false;
    _firstLogin = _mazarbul?.getBool(SharedKeys.firstLogin) ?? false;
  }

  // true -- false => true
  // true -- true => false
  // false -- false => false
  // false -- true => false
  bool checkWelcome() => _welcomeStatus && !_welcomeIsOpened;

  // true -- false => true
  // true -- true => true
  // false -- false => true
  // false -- true => false
  bool checkLogin() => !(!_firstLogin && _autoLogin);

  void start(BuildContext context) {
    if (checkWelcome()) {
      pushWelcome(context);
    } else if (checkLogin()) {
      //pushLogin
    } else {
      //checAautologinpageasync ****();
    }
  }

  void pushWelcome(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => baseWelcomeWidgetModel ?? Eroor(),
    ));
  }

  void comlateWelcome(BuildContext context) {
    _mazarbul?.saveBool(SharedKeys.welcomeIsOpened, true);
    //push login
  }

  static Calacirya get instance => _calacirya.status ? _calacirya : throw CalaciryaInitException();
}

class Eroor extends StatelessWidget {
  const Eroor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
