import 'package:flutter/material.dart';

extension BuildContextExtention on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Size get deviceSize => MediaQuery.sizeOf(this);
}
