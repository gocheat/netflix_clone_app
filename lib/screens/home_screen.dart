import 'package:flutter/material.dart';
import 'package:netflix_clone/model/move_model.dart';
import 'package:netflix_clone/widgets/box_slider.dart';
import 'package:netflix_clone/widgets/carousel_Image.dart';
import 'package:netflix_clone/widgets/circle_slider.dart';

// 영화 정보, 미리보기 화면
class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.formMap({
      'title': '상견리',
      'keyword': '사랑/판타지/로맨스',
      'poster': 'images/mw2lS4rjo5lt4v2L2tI6xaVJCgM.jpeg',
      'like': false,
    }),
    Movie.formMap({
      'title': '상견리',
      'keyword': '사랑/판타지/로맨스',
      'poster': 'images/mw2lS4rjo5lt4v2L2tI6xaVJCgM.jpeg',
      'like': true,
    }),
    Movie.formMap({
      'title': '상견리',
      'keyword': '사랑/판타지/로맨스',
      'poster': 'images/mw2lS4rjo5lt4v2L2tI6xaVJCgM.jpeg',
      'like': false,
    }),
    Movie.formMap({
      'title': '상견리',
      'keyword': '사랑/판타지/로맨스',
      'poster': 'images/mw2lS4rjo5lt4v2L2tI6xaVJCgM.jpeg',
      'like': false,
    })
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(children: [
          CarouselImage(movies),
          CircleSlider(
            movies: movies,
          ),
          BoxSlider(
            movies: movies,
          )
        ]),
        TabBar(),
      ],
    );
  }
}

class TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/netflix-logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
