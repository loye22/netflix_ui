import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/providers/app_bar_provider.dart';
import 'package:netflix_clone/widgets/content_header.dart';
import 'package:netflix_clone/widgets/content_list.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/previewWidget.dart';

class homeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  final Key key ;

  const homeScreen({this.key}) : super(key: key);


  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  double _offset =0.0;
  ScrollController _scrole;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrole = ScrollController();
      // ..addListener(() {
      //   setState(() {
      //    // _offset = _scrole.offset;
      //     pro.setOfset(_scrole.offset);
      //   });
      // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrole.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var pro = Provider.of<appBarProvider>(context);
    _offset = pro.getOffSet;
    _scrole ..addListener(() {
      setState(() {
        pro.setOfset(_scrole.offset);
      });
    });



    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
        onPressed: () {},
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: customAppBar(offset: _offset),
      ),
      body: CustomScrollView(
        controller: _scrole,
        slivers: [
          SliverToBoxAdapter(
              child: contentheader(
            content: sintelContent,
          )),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Preview(
                key: PageStorageKey('Preview'),
                title : 'Previews' ,
                contentList: previews
              ),
            ),
          ) ,
          SliverToBoxAdapter(
            child: contentList(
                key: PageStorageKey('My list'),
              title : 'My list',
              contentListt : myList
            ),
          ),
          SliverToBoxAdapter(
            child: contentList(
                key: PageStorageKey('Netflix Origin'),
                title : 'Netflix Origin',
                contentListt : originals ,
              isOrigin : true
            ),
          ),
          SliverPadding(
            padding:const EdgeInsets.only(bottom:20) ,
            sliver: SliverToBoxAdapter(
              child: contentList(
                  key: PageStorageKey('trending'),
                  title : 'trending',
                  contentListt : trending
              ),
            ),
          )
        ],
      ),
    );
  }
}
