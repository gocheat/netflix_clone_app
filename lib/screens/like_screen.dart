import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/move_model.dart';

import 'detail_screen.dart';

class LikeScreen extends StatefulWidget {
    @override
    _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            _buildTop(context),
            _buildBody(context),
          ],
        )
    );
  }

  Widget _buildTop(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        children: [
          Image.asset('images/netflix-logo.png', fit: BoxFit.contain, height: 25,),
          SizedBox(width: 15,),
          Text('내가 찜한 목록')
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movies').where('like', isEqualTo: true).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(
      BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    List<QueryDocumentSnapshot> searchResults = [];
    for (QueryDocumentSnapshot d in snapshot) {
      searchResults.add(d);
    }
    return Container(
        child: Expanded(
          child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.5,
              padding: EdgeInsets.all(3),
              children: searchResults
                  .map((data) => _buildListItem(context, data))
                  .toList()),
        ));
  }

  Widget _buildListItem(BuildContext context, QueryDocumentSnapshot data) {
    final movie = Movie.fromSnapshot(data);
    return InkWell(
      child: Image.network(movie.poster),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return DetailScreen(movie: movie);
            }));
      },
    );
  }
}