import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Movie with ChangeNotifier {
  final String title;
  final String keyword;
  final String poster;
  bool like;
  final DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {required this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);

  @override
  String toString() {
    return "Movie<$title:$keyword>";
  }

  void changeLike(){
    like = !like;
    notifyListeners();
  }


}
