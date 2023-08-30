import 'package:calacirya/src/enum/image_path.dart';
import 'package:calacirya/src/enum/asset_type.dart';
import 'package:calacirya/src/enum/lottie_path.dart';
import 'package:calacirya/src/extension/image_path_extension.dart';
import 'package:calacirya/src/extension/lottie_path_extension.dart';

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
    WelcomePageData.fromCalaciryaLottie(_welcomeText, LottiePath.lottie2),
    WelcomePageData.fromCalaciryaLottie(_secondScreenText, LottiePath.lottie10),
    WelcomePageData.fromCalaciryaLottie(_preparedText, LottiePath.lottie3),
    WelcomePageData.fromCalaciryaLottie(_wishingTimeText, LottiePath.lottie5),
    WelcomePageData.fromCalaciryaLottie(_wonderfulExperienceText, LottiePath.lottie7),
    WelcomePageData.fromCalaciryaLottie(_readyForJourneyText, LottiePath.lottie8),
    WelcomePageData.fromCalaciryaLottie(_journeyForYouText, LottiePath.lottie9),
    WelcomePageData.fromCalaciryaLottie(_lastStepText, LottiePath.lottie6),
  ];
}
