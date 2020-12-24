import 'package:ud_design/screen_util/screen_utility.dart';

extension SizeExtension on num {
  ///[ScreenUtility.setWidth]
  double get w => ScreenUtility().setWidth(this);

  ///[ScreenUtility.setHeight]
  double get h => ScreenUtility().setHeight(this);

  ///[ScreenUtility.setSp]
  double get sp => ScreenUtility().setSp(this);

  ///[ScreenUtility.setSp]
  double get ssp => ScreenUtility().setSp(this, allowFontScalingSelf: true);

  ///[ScreenUtility.setSp]
  double get nsp => ScreenUtility().setSp(this, allowFontScalingSelf: false);

  ///Multiple of screen width
  double get sw => ScreenUtility().screenWidth * this;

  ///Multiple of screen height
  double get sh => ScreenUtility().screenHeight * this;
}
