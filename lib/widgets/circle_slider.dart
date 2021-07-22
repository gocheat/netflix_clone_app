import 'package:flutter/material.dart';
import 'package:netflix_clone/model/move_model.dart';
import 'package:netflix_clone/screens/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;

  CircleSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('미리보기'),
        Container(height: 120, child: Container(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: makeCircleImages(context, movies),
          ),
        ),)
      ],),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(onTap: () {
      Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (context){
        return DetailScreen(movie: movies[i]);
      }));

    }, child: Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Align(
        alignment: Alignment.center,
        child: CircleAvatar(
          backgroundImage: NetworkImage(movies[i].poster),
          radius: 48,
        ),
      )
    ),));
  }
  return results;
}