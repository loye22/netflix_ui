import 'package:flutter/material.dart';
import 'package:netflix_clone/providers/app_bar_provider.dart';
import 'package:netflix_clone/sceens/navigate_screen.dart';
import 'sceens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => appBarProvider(),
      child: MaterialApp(
        title: 'Flutter Netflix UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.black),
        home: navScreen(),
        routes: {
          homeScreen.routeName: (ctx) => homeScreen(),
        },
      ),
    );
  }
}

class ss extends StatefulWidget {
  // const ss({Key? key}) : super(key: key);

  @override
  State<ss> createState() => _ssState();
}

class _ssState extends State<ss> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
