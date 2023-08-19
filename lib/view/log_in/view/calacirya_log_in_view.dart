import 'package:calacirya/view/log_in/viewmodel/calacirya_log_in_view_model.dart';
import 'package:flutter/material.dart';

class CalaciryaLoginView extends StatefulWidget {
  const CalaciryaLoginView({Key? key}) : super(key: key);

  @override
  State<CalaciryaLoginView> createState() => _CalaciryaLoginViewState();
}

class _CalaciryaLoginViewState extends CalaciryaLoginViewModel {
  String username = "fatih";
  String password = "fatih";
  bool buttondisable = false;

  void login({String? username, String? password}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: buttondisable ? null : () => login(username: username, password: password),
              child: Text("data"))),
    );
  }
}
