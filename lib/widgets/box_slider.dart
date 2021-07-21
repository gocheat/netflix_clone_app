import 'package:flutter/material.dart';
import 'package:netflix_clone/model/move_model.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;

  BoxSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('지금 뜨는 컨텐츠'),
        Container(height: 120, child: Container(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: makeBoxImages(movies),
          ),
        ),)
      ],),
    );
  }
}

List<Widget> makeBoxImages(List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(Container(
        padding: EdgeInsets.only(right: 15),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              print("${i}: ${movies[i].toString()}");
            },
            child: Image(
              image: AssetImage(movies[i].poster),
              fit: BoxFit.contain,
            ),
          ),
        )
    ));
  }
  return results;
}