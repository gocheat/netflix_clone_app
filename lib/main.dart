import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/widgets/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController _controller;

  @override
  Widget build(BuildContext contet) {
    return MaterialApp(
        title: 'BbongFlix',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            accentColor: Colors.white),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              // 탭 화면을 마우스 모션으로 변경하지 않겠다는 의미
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                Container(
                  child: Center(
                    child: Text('search'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('save'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('more'),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomBar(),
          ),
        ));
  }
}
