import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/content_model.dart';

class Preview extends StatelessWidget {
  // const Preview({Key? key}) : super(key: key);
  final String title;

  final List<Content> contentList;

  const Preview({Key key, this.title, this.contentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          height: 160,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },),
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                itemCount: contentList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) => GestureDetector(
                      onTap: () {
                        print(contentList[i].name);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(contentList[i].imageUrl)),
                                border: Border.all(
                                    color: contentList[i].color, width: 4),
                                shape: BoxShape.circle),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black87,
                                      Colors.black45,
                                      Colors.transparent
                                    ],
                                    stops: [
                                      0.0,
                                      0.25,
                                      1
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter),
                                border: Border.all(
                                    color: contentList[i].color, width: 4),
                                shape: BoxShape.circle),
                          ),
                          Positioned(
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: SizedBox(
                                height: 60,
                                child:
                                    Image.asset(contentList[i].titleImageUrl),
                              ))
                        ],
                      ),
                    )),
          ),
        )
      ],
    );
  }
}
