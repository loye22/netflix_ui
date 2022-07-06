import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';
import 'package:netflix_clone/widgets/responsive.dart';
import 'package:netflix_clone/widgets/vertical_Icon_button.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class contentheader extends StatelessWidget {
  //const contentheader({Key? key}) : super(key: key);
  final Content content;

  const contentheader({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // _contentHeaderMobile(content: content);
        Responsive(
      desktop: _contentHeaderDesktop(content: content),
      mobile: _contentHeaderMobile(content: content),
    );
  }
}

class _playButton extends StatelessWidget {
  //const _playButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.play_arrow),
      label: Text("Play"),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 15),
      ),
    );
  }
}

class _contentHeaderMobile extends StatelessWidget {
  // const _contentHeaderMobile({Key? key}) : super(key: key);
  final Content content;

  const _contentHeaderMobile({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            height: 500,
            //    width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(content.imageUrl), fit: BoxFit.cover))),
        Container(
          height: 500,
          //width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 100,
          child: Container(
            width: 200,
            child: Image.asset(content.titleImageUrl),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: 'List',
                  ontap: () {},
                ),
                _playButton(),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title: 'List',
                  ontap: () {},
                )
              ],
            ))
      ],
    );
  }
}

class _contentHeaderDesktop extends StatefulWidget {
  // const _contentHeaderMobile({Key? key}) : super(key: key);
  final Content content;
  VideoPlayerController _videoCon;
  bool _isMute = false;

  _contentHeaderDesktop({Key key, this.content}) : super(key: key);

  @override
  State<_contentHeaderDesktop> createState() => _contentHeaderDesktopState();
}

class _contentHeaderDesktopState extends State<_contentHeaderDesktop> {
  VideoPlayerController _videoCon;
  bool _isMute = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoCon = VideoPlayerController.network(widget.content.videoUrl)
      ..initialize().then((_) => setState(() {}))
      ..setVolume(0)
      ..play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
       _videoCon.value.isPlaying
            ? _videoCon.pause()
            : _videoCon.play()
      ,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoCon.value.isInitialized
                ? _videoCon.value.aspectRatio
                : 2.344,
            child: _videoCon.value.isInitialized
                ? VideoPlayer(_videoCon)
                : Image.asset(
                    widget.content.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Container(
            height: 500,
            //width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset(widget.content.titleImageUrl),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.content.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                            color: Colors.black45,
                            offset: Offset(2.0, 4.0),
                            blurRadius: 6.0)
                      ]),
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    _playButton(),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'info',
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    if (_videoCon.value.isInitialized)
                      IconButton(
                        icon: Icon(
                          _isMute ? Icons.volume_off : Icons.volume_up,
                        ),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () => setState(() {
                          _isMute
                              ? _videoCon.setVolume(100)
                              : _videoCon.setVolume(0);
                          _isMute = _videoCon.value.volume == 0;
                        }),
                      ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//
// class _ContentHeaderDesktop extends StatefulWidget {
//   final Content featuredContent;
//
//   const _ContentHeaderDesktop({
//     Key key,
//     @required this.featuredContent,
//   }) : super(key: key);
//
//   @override
//   __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
// }
//
// class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
//   VideoPlayerController _videoController;
//   bool _isMuted = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _videoController =
//     VideoPlayerController.network(widget.featuredContent.videoUrl)
//       ..initialize().then((_) => setState(() {}))
//       ..setVolume(0)
//       ..play();
//   }
//
//   @override
//   void dispose() {
//     _videoController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _videoController.value.isPlaying
//           ? _videoController.pause()
//           : _videoController.play(),
//       child: Stack(
//         alignment: Alignment.bottomLeft,
//         children: [
//           AspectRatio(
//             aspectRatio: _videoController.value.isInitialized
//                 ? _videoController.value.aspectRatio
//                 : 2.344,
//             child: _videoController.value.isInitialized
//                 ? VideoPlayer(_videoController)
//                 : Image.asset(
//               widget.featuredContent.imageUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: -1.0,
//             child: AspectRatio(
//               aspectRatio: _videoController.value.isInitialized
//                   ? _videoController.value.aspectRatio
//                   : 2.344,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.black, Colors.transparent],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 60.0,
//             right: 60.0,
//             bottom: 150.0,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 250.0,
//                   child: Image.asset(widget.featuredContent.titleImageUrl),
//                 ),
//                 const SizedBox(height: 15.0),
//                 Text(
//                   widget.featuredContent.description,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w500,
//                     shadows: [
//                       Shadow(
//                         color: Colors.black,
//                         offset: Offset(2.0, 4.0),
//                         blurRadius: 6.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Row(
//                   children: [
//                     _playButton(),
//                     const SizedBox(width: 16.0),
//
//                     const SizedBox(width: 20.0),
//                     if (_videoController.value.isInitialized)
//                       IconButton(
//                         icon: Icon(
//                           _isMuted ? Icons.volume_off : Icons.volume_up,
//                         ),
//                         color: Colors.white,
//                         iconSize: 30.0,
//                         onPressed: () => setState(() {
//                           _isMuted
//                               ? _videoController.setVolume(100)
//                               : _videoController.setVolume(0);
//                           _isMuted = _videoController.value.volume == 0;
//                         }),
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
