import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/config/routes.dart';
import 'package:netflix_clone/model/current_page_model.dart';
import 'package:netflix_clone/model/move_model.dart';
import 'package:netflix_clone/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  CarouselImage(this.movies);

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie> movies = [];
  List<Widget> images = [];
  List<String> keywords = [];
  List<bool> likes = [];
  int _currentPage = 0;
  String _currentKeyword = '';

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.network(m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    var page = Provider.of<CurrentPage>(context, listen: false);

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
              items: images,
              options: CarouselOptions(onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[index];
                });
              })),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      likes[_currentPage]
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = false;
                                  movies[_currentPage]
                                      .reference
                                      .update({'like': likes[_currentPage]});
                                });
                              },
                              icon: Icon(Icons.check))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = true;
                                  movies[_currentPage]
                                      .reference
                                      .update({'like': likes[_currentPage]});
                                });
                              },
                              icon: Icon(Icons.add)),
                      Text(
                        "?????? ?????? ?????????",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                // ?????? ??????
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextButton(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (!states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        } else {
                          return Colors.white12;
                        }
                      })),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow, color: Colors.black),
                          Padding(padding: EdgeInsets.all(3)),
                          Text(
                            "??????",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            page.changePage(RouteList.detail);
                            Navigator.of(context).push(MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return DetailScreen(
                                      movie: movies[_currentPage]);
                                }));
                          },
                          icon: Icon(Icons.info)),
                      Text("??????",
                          style: TextStyle(
                            fontSize: 13,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i
                ? Color.fromRGBO(255, 255, 255, 0.9)
                : Color.fromRGBO(255, 255, 255, 0.4))));
  }
  return results;
}
