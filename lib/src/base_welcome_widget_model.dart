import 'package:calacirya/calacirya.dart';
import 'package:flutter/material.dart';

abstract class BaseWelcomeWidgetModel extends StatefulWidget {
  const BaseWelcomeWidgetModel({super.key});

  void comlateWelcome(BuildContext context) {
    Calacirya.instance.comlateWelcome(context);
  }
}
