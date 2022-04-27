import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
  }
}
