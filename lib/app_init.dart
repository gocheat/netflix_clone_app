import 'package:flutter/material.dart';
import 'package:netflix_clone/config/routes.dart';

class AppInit extends StatefulWidget {
  @override
  _AppInitState createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {

  @override
  void initState() {
    super.initState();

    //build 가 끝난후 실행
    WidgetsBinding.instance!.addPostFrameCallback((_){
      afterFirstLayout(context);
    });
  }

  void afterFirstLayout(BuildContext context) async {
    await _loadInitData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }


  //앱초기 설정
  Future<void> _loadInitData() async {
    Navigator.of(context).pushReplacementNamed(RouteList.home);
  }

}