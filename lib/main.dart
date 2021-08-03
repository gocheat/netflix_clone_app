import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/current_page_model.dart';
import 'package:netflix_clone/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

import 'app_init.dart';
import 'common/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentPage())
      ],
      child: MyApp())
  );
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Netflix Clone',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            accentColor: Colors.white),
        routes: Routes.getAll(),
        onGenerateRoute: (RouteSettings settings) {
          print('Route Move!! ${settings.name}');
        },
        home: Scaffold(
          body: AppInit(),
        ));
  }
}
