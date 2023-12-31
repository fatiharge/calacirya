/*
 * Copyright (c) 2023 fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 *  Author : Fatih Çetin
 *  Mail   : fatih@fatiharge.com
 *
 */

import 'package:calacirya/enum/asset_type.dart';
import 'package:calacirya/enum/image_path.dart';
import 'package:calacirya/enum/lottie_path.dart';
import 'package:calacirya/extension/image_path_extension.dart';
import 'package:calacirya/extension/lottie_path_extension.dart';

/// Represents data for a welcome page in the application.
class WelcomePageData {
  /// Title of the welcome page.
  final String title;

  /// Path to the image or lottie animation.
  final String imagePath;

  /// Type of the image (image or lottie).
  final AssetType imageType;

  /// Indicates whether the data is specific to the Calacirya project.
  final bool calacirya;

  /// Constructs a [WelcomePageData] object.
  WelcomePageData._({
    required this.calacirya,
    required this.title,
    required this.imageType,
    required this.imagePath,
  });

  /// Constructs a [WelcomePageData] object from an image path.
  factory WelcomePageData.fromImage(String title, String imagePath) {
    return WelcomePageData._(
      calacirya: false,
      title: title,
      imageType: AssetType.image,
      imagePath: imagePath,
    );
  }

  /// Constructs a [WelcomePageData] object from a lottie animation path.
  factory WelcomePageData.fromLottie(String title, String lottiePath) {
    return WelcomePageData._(
      calacirya: false,
      title: title,
      imageType: AssetType.lottie,
      imagePath: lottiePath,
    );
  }

  /// Constructs a [WelcomePageData] object with Calacirya-specific image path.
  factory WelcomePageData.fromCalaciryaImage(String title, ImagePath imagePath, String? fileType) {
    return WelcomePageData._(
      calacirya: true,
      title: title,
      imageType: AssetType.image,
      imagePath: imagePath.toPath(fileType: fileType),
    );
  }

  /// Constructs a [WelcomePageData] object with Calacirya-specific lottie path.
  factory WelcomePageData.fromCalaciryaLottie(String title, LottiePath lottiePath) {
    return WelcomePageData._(
      calacirya: true,
      title: title,
      imageType: AssetType.lottie,
      imagePath: lottiePath.toPath,
    );
  }

  static const String _welcomeText = 'Welcome!';
  static const String _secondScreenText = 'How wonderful to have you among us!';
  static const String _preparedText = 'Our application has been prepared carefully for you.';
  static const String _wishingTimeText = 'Wishing you a pleasant time!';
  static const String _wonderfulExperienceText = 'You are about to experience something amazing!';
  static const String _readyForJourneyText = 'Are you ready for an amazing journey?';
  static const String _journeyForYouText = 'This journey is for you!';
  static const String _lastStepText = 'Here is the final step!';

  static List<WelcomePageData> dummyList = [
    WelcomePageData.fromCalaciryaLottie(_welcomeText, LottiePath.lottieWelcomeText),
    WelcomePageData.fromCalaciryaLottie(_secondScreenText, LottiePath.lottieSecondScreenText),
    WelcomePageData.fromCalaciryaLottie(_preparedText, LottiePath.lottiePreparedText),
    WelcomePageData.fromCalaciryaLottie(_wishingTimeText, LottiePath.lottieWishingTimeText),
    WelcomePageData.fromCalaciryaLottie(_wonderfulExperienceText, LottiePath.lottieWonderfulExperienceText),
    WelcomePageData.fromCalaciryaLottie(_readyForJourneyText, LottiePath.lottieReadyForJourneyText),
    WelcomePageData.fromCalaciryaLottie(_journeyForYouText, LottiePath.lottieJourneyForYouText),
    WelcomePageData.fromCalaciryaLottie(_lastStepText, LottiePath.lottieLastStepText),
  ];
}
