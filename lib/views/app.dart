import 'package:flutter/cupertino.dart';
import '../screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino App',
      home: CupertinoPageScaffold(
        child: Center(
          child: Container(
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}