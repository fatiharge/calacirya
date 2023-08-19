import 'package:flutter/material.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class StateMain<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading({bool? value, bool? loading}) {
    if (loading ?? false) {
      if (isLoading) {
        //EasyLoading.dismiss();
      } else {
        //EasyLoading.show();
      }
    }

    setState(() {
      isLoading = value ?? !isLoading;
    });
  }

  void syncProcessUi({required Function func, bool? value, bool loading = false}) {
    changeLoading(loading: loading, value: value);
    func();
    changeLoading(loading: loading, value: value);
  }
}
