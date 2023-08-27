import 'package:calacirya/calacirya.dart';
import 'package:flutter/material.dart';

abstract class StateMain<T extends StatefulWidget> extends State<T> {}

abstract class CalaciryaWiew extends StatefulWidget {
  const CalaciryaWiew({super.key});
  void comlateWelcome(BuildContext context) {
    Calacirya.instance.comlateWelcome(context);
  }
}

class a extends CalaciryaWiew {
  const a({super.key});

  @override
  State<a> createState() => _aState();
}

class _aState extends StateMain<a> {
  @override
  void initState() {
    // TODO: implement initState
    widget.comlateWelcome(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
