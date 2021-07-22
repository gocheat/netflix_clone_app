import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.black,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text('SIN IL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ))),
              Container(
                padding: EdgeInsets.only(top: 15),
                width: 140,
                height: 5,
                color: Colors.red,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    }
                  },
                  text: "https://github.com/gocheat",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  linkStyle: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("프로필 수정하기", style: TextStyle(
                        color: Colors.white,
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
