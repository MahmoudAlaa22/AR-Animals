// ignore_for_file: public_member_api_docs

/// Contain all application images and icons and vector (illustrator) images
abstract class Images {
  /// Private Const constructor to prevent getting an object of this class
  const Images._();
  /// All images that stored in this path
  static const _folderPath = 'assets/images';
  //SVG #################################################################
  static const _svgIconPath = '$_folderPath/svg';
  static const bgSplash = '$_svgIconPath/bg_splash.svg';
  //PNG #################################################################
  static const _pngIconPath = '$_folderPath/png';
  static const cat = '$_pngIconPath/cat.png';
  static const dog = '$_pngIconPath/dog.png';
  static const bear = '$_pngIconPath/bear.png';
  static const tiger = '$_pngIconPath/tiger.png';
  static const shark = '$_pngIconPath/shark.png';
  static const snake = '$_pngIconPath/snake.png';
  static const connectUs = '$_pngIconPath/connect_us.png';
  static const aboutUs = '$_pngIconPath/about_us.png';
  static const setting = '$_pngIconPath/setting.png';
  static const lock = '$_pngIconPath/lock.png';
  static const star = '$_pngIconPath/star.png';

}
