import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_clone/model/move_model.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  DetailScreen({required this.movie});

  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
      children: [
        Stack(children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(widget.movie.poster),
              fit: BoxFit.cover,
            )),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.1),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                          child: Image.asset(
                            widget.movie.poster,
                            fit: BoxFit.contain,
                          ),
                          height: 300,
                        ),
                        Container(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            '99% 일치 2022 15+ 시즌 1개',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(7),
                          child: Text(widget.movie.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.all(3),
                            child: TextButton(
                              onPressed: () { print('??');},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_arrow, color: Colors.white),
                                  Text(
                                    "재생",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(widget.movie.toString(),
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text('출연: 이신일, 김미현 \n제작자: 이신일',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54)))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ))
        ]),
        Container(
          color: Colors.black26,
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: InkWell(
                        onTap: () { print('??');},
                        child: Column(
                          children: [
                            like ? Icon(Icons.check) : Icon(Icons.add),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text('내가 찜한 콘텐츠',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white60)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: InkWell(
                        onTap: () { print('??');},
                        child: Column(
                          children: [
                            Icon(Icons.thumb_up),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text('평가',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white60)),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () { print('??');},
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          children: [
                            Icon(Icons.send),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text('공유',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white60)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    )));
  }
}
