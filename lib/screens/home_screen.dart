import 'package:cloud_firestore/cloud_firestore.dart';
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
  final Stream<QuerySnapshot> _moviesStream = FirebaseFirestore.instance.collection('movies').snapshots();

  @override
  void initState() {
    super.initState();
  }

  // 데이터 호출
  Widget _fetchMovies(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _moviesStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.docs );
      },
    );
  }

  Widget _buildBody(BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
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

  @override
  Widget build(BuildContext context) {
    return _fetchMovies(context);
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
