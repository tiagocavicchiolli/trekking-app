import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width < 600;
}

bool isTablet(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width >= 600 && width < 1200;
}

bool isDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width >= 1200;
}
