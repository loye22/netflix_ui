import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';

//contentList
class contentList extends StatelessWidget {
  //const contentList({Key? key}) : super(key: key);
  final String title;

  final List<Content> contentListt;

  final bool isOrigin;

  const contentList(
      {Key key, this.title, this.contentListt, this.isOrigin = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
        Container(
          height: isOrigin ? 500 : 220,
          child:
          ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },),
              child : ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: contentListt.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: isOrigin ? 400 : 200,
                      width: isOrigin ? 200 : 130,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(contentListt[i].imageUrl) ,fit: BoxFit.cover)),
                    ),
                  ))),
        )
      ]),
    );
  }
}
