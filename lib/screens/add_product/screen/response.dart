import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: _getContainerWidth(context),
            height: _getContainerHeight(context),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  double _getContainerWidth(BuildContext context) {
    if (kIsWeb) {
      // Adjust width for web platform
      return MediaQuery.of(context).size.width * 0.5;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Adjust width for iOS platform
      return 200.0;
    } else {
      // Default width for other platforms
      return 300.0;
    }
  }

  double _getContainerHeight(BuildContext context) {
    if (kIsWeb) {
      // Adjust height for web platform
      return MediaQuery.of(context).size.height * 0.3;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Adjust height for iOS platform
      return 150.0;
    } else {
      // Default height for other platforms
      return 200.0;
    }
  }
}
