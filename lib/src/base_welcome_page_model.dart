import 'package:calacirya/calacirya.dart';
import 'package:flutter/material.dart';

/// Abstract base class for welcome widget models.
abstract class BaseWelcomePageModel extends StatefulWidget {
  /// Creates a new instance of [BaseWelcomePageModel].
  ///
  /// [key] parameter is inherited from [StatefulWidget] class.
  const BaseWelcomePageModel({Key? key}) : super(key: key);

  /// Completes the welcome process.
  ///
  /// This method uses the [Calacirya] instance to signal that the welcome
  /// process is complete. It takes a [BuildContext] parameter to navigate
  /// or perform necessary actions after the welcome is completed.
  void completeWelcome(BuildContext context) => Calacirya.instance.completeWelcome(context);
}
