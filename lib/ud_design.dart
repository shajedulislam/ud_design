library ud_design;

import 'package:flutter/material.dart';
import 'package:ud_design/enums.dart';
import 'package:ud_design/values.dart';
import 'enums.dart';
import 'font_responsiveness.dart';
export 'package:ud_design/values.dart';
export 'package:ud_design/enums.dart';

///UdDesign will help you making responsive application in many ways!
class UdDesign {
  static bool _init = false;
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;
  static UdDeviceType? deviceType;
  static Orientation? orientation;

  ///returns device type based on screen width
  static UdDeviceType getDeviceType() {
    if (screenWidth <= 440) {
      return UdDeviceType.mobile;
    } else if (screenWidth > 440 && screenWidth <= 542) {
      return UdDeviceType.tabletSmall;
    } else if (screenWidth > 542 && screenWidth <= 628) {
      return UdDeviceType.tabletMedium;
    } else if (screenWidth > 628 && screenWidth <= 770) {
      return UdDeviceType.tabletLarge;
    } else if (screenWidth > 770 && screenWidth <= 842) {
      return UdDeviceType.tabletExtraLarge;
    } else if (screenWidth > 842 && screenWidth <= 1320) {
      return UdDeviceType.desktopSmall;
    } else if (screenWidth > 1320 && screenWidth <= 1712) {
      return UdDeviceType.desktopMedium;
    } else if (screenWidth > 1712 && screenWidth <= 2460) {
      return UdDeviceType.desktopLarge;
    } else {
      return UdDeviceType.desktopExtraLarge;
    }
  }

  ///For responsiveness you can use this function by passing how much screen portion you want to use in horizontal (X) axis in the range of `0% - 100%`.
  static double blocksXaxis(double blocks) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    return _blockSizeHorizontal * blocks;
  }

  ///For responsiveness you can use this function by passing how much screen portion you want to use in vertical (Y) axis in the range of `0% - 100%`.
  static double blocksYaxis(double blocks) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    return _blockSizeVertical * blocks;
  }

  ///Flutter does not have exact solution to use point or pt values for responsiveness but we tried to make one and it works nice. You can try out by passing point or pt values.
  @Deprecated('Use `UdDesign.pt()` instead. Will be removed soon')
  static double pixels(double pt) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    if (deviceType == UdDeviceType.mobile ||
        deviceType == UdDeviceType.tabletSmall ||
        deviceType == UdDeviceType.tabletMedium ||
        deviceType == UdDeviceType.tabletLarge ||
        deviceType == UdDeviceType.tabletExtraLarge) {
      return _blockSizeHorizontal * pt * 0.267;
    } else {
      return pt;
    }
  }

  ///Flutter does not have exact solution to use point or pt values for responsiveness but we tried to make one and it works nice. You can try out by passing point or pt values.
  static double pt(double pt) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build() function and it should be inside a MaterialApp, Not Before MaterialApp.\n",
    );
    if (deviceType == UdDeviceType.mobile ||
        deviceType == UdDeviceType.tabletSmall ||
        deviceType == UdDeviceType.tabletMedium ||
        deviceType == UdDeviceType.tabletLarge ||
        deviceType == UdDeviceType.tabletExtraLarge) {
      return _blockSizeHorizontal * pt * 0.267;
    } else {
      return pt;
    }
  }

  /// To make responsive font size, use this function
  static double fontSize(double size) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build() function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );

    if (deviceType == UdDeviceType.mobile) {
      return FontResponsiveness().setSp(size);
    } else if (deviceType == UdDeviceType.tabletSmall) {
      return FontResponsiveness().setSp(size * 1.14);
    } else if (deviceType == UdDeviceType.tabletMedium) {
      return FontResponsiveness().setSp(size * 1.15);
    } else if (deviceType == UdDeviceType.tabletLarge) {
      return FontResponsiveness().setSp(size * 1.17);
    } else if (deviceType == UdDeviceType.tabletExtraLarge) {
      return FontResponsiveness().setSp(size * 1.17);
    } else {
      return size;
    }
  }

  /// You must call this function in a [ Widget build ] function and it should be inside [ MaterialApp ]. Not Before [ MaterialApp ].
  static void init(BuildContext context) {
    _init = true;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = screenWidth / 100;
    _blockSizeVertical = screenHeight / 100;
    orientation = _mediaQueryData.orientation;

    // print(screenWidth);
    // print(screenHeight);
    // print(orientation);

    if (screenWidth <= 440) {
      deviceType = UdDeviceType.mobile;
    } else if (screenWidth > 440 && screenWidth <= 542) {
      deviceType = UdDeviceType.tabletSmall;
    } else if (screenWidth > 542 && screenWidth <= 628) {
      deviceType = UdDeviceType.tabletMedium;
    } else if (screenWidth > 628 && screenWidth <= 770) {
      deviceType = UdDeviceType.tabletLarge;
    } else if (screenWidth > 770 && screenWidth <= 842) {
      deviceType = UdDeviceType.tabletExtraLarge;
    } else if (screenWidth > 842 && screenWidth <= 1320) {
      deviceType = UdDeviceType.desktopSmall;
    } else if (screenWidth > 1320 && screenWidth <= 1712) {
      deviceType = UdDeviceType.desktopMedium;
    } else if (screenWidth > 1712 && screenWidth <= 2460) {
      deviceType = UdDeviceType.desktopLarge;
    } else {
      deviceType = UdDeviceType.desktopExtraLarge;
    }

    //print(deviceType);

    late double defaultScreenWidth;
    late double defaultScreenHeight;

    if (deviceType == UdDeviceType.mobile) {
      defaultScreenWidth = ProjectValues.screen_width_mobileAll;
      defaultScreenHeight = ProjectValues.screen_height_mobileAll;
    } else if (deviceType == UdDeviceType.tabletSmall) {
      defaultScreenWidth = ProjectValues.screen_width_tabletSmall;
      defaultScreenHeight = ProjectValues.screen_height_tabletSmall;
    } else if (deviceType == UdDeviceType.tabletMedium) {
      defaultScreenWidth = ProjectValues.screen_width_tabletMedium;
      defaultScreenHeight = ProjectValues.screen_height_tabletMedium;
    } else if (deviceType == UdDeviceType.tabletLarge) {
      defaultScreenWidth = ProjectValues.screen_width_tabletLarge;
      defaultScreenHeight = ProjectValues.screen_height_tabletLarge;
    } else if (deviceType == UdDeviceType.tabletExtraLarge) {
      defaultScreenWidth = ProjectValues.screen_width_tabletExtraLarge;
      defaultScreenHeight = ProjectValues.screen_height_tableExtratLarge;
    } else if (deviceType == UdDeviceType.desktopSmall) {
      defaultScreenWidth = ProjectValues.screen_width_desktopSmall;
      defaultScreenHeight = ProjectValues.screen_height_desktopSmall;
    } else if (deviceType == UdDeviceType.desktopMedium) {
      defaultScreenWidth = ProjectValues.screen_width_desktopMedium;
      defaultScreenHeight = ProjectValues.screen_height_desktopMedium;
    } else if (deviceType == UdDeviceType.desktopLarge) {
      defaultScreenWidth = ProjectValues.screen_width_desktopLarge;
      defaultScreenHeight = ProjectValues.screen_height_desktopLarge;
    } else if (deviceType == UdDeviceType.desktopExtraLarge) {
      defaultScreenWidth = ProjectValues.screen_width_desktopExtraLarge;
      defaultScreenHeight = ProjectValues.screen_height_desktopExtraLarge;
    }

    FontResponsiveness.init(
      context,
      designSize: Size(defaultScreenWidth, defaultScreenHeight),
    );
  }
}
