import 'package:flutter/material.dart';

class NavbarKey {
  NavbarKey._();
  static final GlobalKey _key = GlobalKey();
  static GlobalKey getKey() => _key;
}
