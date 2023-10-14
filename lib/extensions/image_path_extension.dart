/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

import 'package:calacirya/enums/image_path.dart';

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
