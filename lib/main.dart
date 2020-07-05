import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readtextfile/src/startScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

//  SystemChrome.setSystemUIOverlayStyle(
//      SystemUiOverlayStyle(statusBarColor: appBarColor));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new SixKicksApp());
  });
}

class SixKicksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Load text data to map',
      home: StartScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor({final String hexColor}) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
