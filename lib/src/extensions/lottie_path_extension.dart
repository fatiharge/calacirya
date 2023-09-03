/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

import 'package:calacirya/src/enums/lottie_path.dart';

/// Extension to convert [LottiePath] enum values to Lottie animation paths.
extension LottiePathExtension on LottiePath {
  /// Converts the [LottiePath] enum value to a corresponding Lottie animation path.
  ///
  /// The animation path is constructed by converting the enum name to lowercase
  /// and appending ".json" to it.
  String get toPath {
    return 'assets/${name.toLowerCase()}.json';
  }
}
