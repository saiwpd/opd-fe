import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoaderIndicator extends StatelessWidget {
  const AppLoaderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitThreeBounce(
      color: Color(0xffE8DEF8),
      size: 40,
    ));
  }
}
