import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashAppBar extends AppBar {

  SplashAppBar({super.key}) : super(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white, 
        statusBarIconBrightness: Brightness.dark, 
        statusBarBrightness: Brightness.light
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      toolbarHeight: 0.0,
  );
}