import 'package:calacirya/src/enum/image_path.dart';

/// Extension to convert [ImagePath] enum values to image paths.
extension PngPathExtension on ImagePath {
  /// Converts the [ImagePath] enum value to a corresponding image path.
  ///
  /// Optionally, a [fileType] can be provided to specify the file extension.
  /// If not provided, the default value "png" will be used.
  String toPath({String? fileType}) {
    return 'assets/${name.toLowerCase()}.${fileType ?? "png"}';
  }
}
