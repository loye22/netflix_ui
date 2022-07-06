import 'package:flutter/material.dart';
import 'package:netflix_clone/sceens/home_screen.dart';
import 'package:netflix_clone/widgets/responsive.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class navScreen extends StatefulWidget {
  //const navScreen({Key? key}) : super(key: key);

  @override
  State<navScreen> createState() => _navScreenState();
}

class _navScreenState extends State<navScreen> {
  List<Widget> _screens =  [
    homeScreen(key: PageStorageKey('home'),),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  int _cuuentpage = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_cuuentpage],
      bottomNavigationBar: !kIsWeb?   BottomNavigationBar(
        backgroundColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
     //   backgroundColor: Colors.black,
        currentIndex: _cuuentpage,
        selectedItemColor: Colors.white,
        selectedFontSize: 11,
        unselectedItemColor: Colors.grey,
        onTap:(i){setState(()=> _cuuentpage = i );} ,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)  ,label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search)  ,label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.queue_play_next)  ,label: 'comming soon'),
          BottomNavigationBarItem(icon: Icon(Icons.download)  ,label: 'download'),
          BottomNavigationBarItem(icon: Icon(Icons.menu)  ,label: 'more'),
        ],

      ) :null
      ,
    );
  }
}
