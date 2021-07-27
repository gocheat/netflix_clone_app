import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/like_screen.dart';
import 'package:netflix_clone/screens/more_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        title: 'Netflix Clone',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            accentColor: Colors.white),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: SafeArea(
              child: TabBarView(
                // 탭 화면을 마우스 모션으로 변경하지 않겠다는 의미
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomeScreen(),
                  SearchScreen(),
                  LikeScreen(),
                  MoreScreen(),
                ],
              ),
            ),
            bottomNavigationBar: BottomBar(),
          ),
        ));
  }
}
