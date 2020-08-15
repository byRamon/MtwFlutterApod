import 'package:apod_app/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'apod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super (key : key);
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('APOD')),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.gear_solid), title: Text('Settings')),
        ],
      ), 
      tabBuilder: (context, index){
        return CupertinoTabView(
          //routes: getApplicationRoutes(),
          builder: (context){
            switch(index){
              case 0: 
                return Apod();
                break;
              case 1: 
                return Settings();
                break;
            }
            return Apod();
          },
        );
      },
    );
  }
}