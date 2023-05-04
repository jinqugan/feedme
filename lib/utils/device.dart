import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:core';

enum DeviceType { phone, tablet, desktop }

final mediaData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

DeviceType getDeviceType() {
  Orientation orientation = mediaData.orientation;
  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaData.size.height;
  } else {
    deviceWidth = mediaData.size.width;
  }

  if (deviceWidth > 950) {
    return DeviceType.desktop;
  }

  if (deviceWidth > 550) {
    return DeviceType.tablet;
  }

  return DeviceType.phone;
}

bool isDesktop() {
  return getDeviceType() == DeviceType.desktop ? true : false;
}

bool isTablet() {
  return getDeviceType() == DeviceType.tablet ? true : false;
}

bool isPhone() {
  return getDeviceType() == DeviceType.phone ? true : false;
}

double getDeviceWidth() {
  return mediaData.size.width;
}

EdgeInsets mediaViewPadding() {
  return mediaData.viewPadding;
}

double mediaBarHeight() {
  return mediaData.padding.top + kToolbarHeight;
}

double getDeviceHeight({bool internal = true}) {
  double toolbarHeight = kToolbarHeight;
  double barHeight =
      mediaData.padding.top + toolbarHeight + mediaData.padding.bottom;
  double height = mediaData.size.height;

  if (internal) height = height - barHeight;

  return height;
}
