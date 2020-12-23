import 'screen_util.dart';

extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(this);

  double get h => ScreenUtil().setHeight(this);

  double get sp => ScreenUtil().setSp(this);

  double get ssp => ScreenUtil().setSp(this, allowFontScalingSelf: true);

  double get nsp => ScreenUtil().setSp(this, allowFontScalingSelf: false);

  double get sw => ScreenUtil().screenWidth * this;

  double get sh => ScreenUtil().screenHeight * this;
}
