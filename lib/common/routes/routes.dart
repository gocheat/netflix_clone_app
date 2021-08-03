import 'package:flutter/material.dart';
import 'package:netflix_clone/config/routes.dart';
import 'package:netflix_clone/screens/detail_screen.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/like_screen.dart';
import 'package:netflix_clone/screens/more_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    RouteList.like: (context) => LikeScreen(),
    RouteList.home: (context) => HomeScreen(),
    RouteList.more: (context) => MoreScreen(),
    RouteList.search: (context) => SearchScreen(),
  };

  static Map<String, WidgetBuilder> getAll() {
    return _routes;
  }

}