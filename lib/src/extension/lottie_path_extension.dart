import 'package:calacirya/src/enum/lottie_path.dart';

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
