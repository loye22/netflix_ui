import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';
import 'package:netflix_clone/widgets/responsive.dart';

class customAppBar extends StatelessWidget {
  //const customAppBar({Key? key}) : super(key: key);
  final double offset;

  customAppBar({this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black.withOpacity((offset / 360).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _customAppBarMobile(),
        desktop: _customAppBarDesktop(),
      ),
    );
  }
}

class _appBarButtons extends StatelessWidget {
  final String txt;

  final Function onTab;

  const _appBarButtons({Key key, this.txt, this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        txt,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      onTap: onTab,
    );
  }
}

class _customAppBarMobile extends StatelessWidget {
  //const _customAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _appBarButtons(
                  txt: 'Tv Shows',
                  onTab: () {},
                ),
                _appBarButtons(
                  txt: 'Tv Shows',
                  onTab: () {},
                ),
                _appBarButtons(
                  txt: 'Tv Shows',
                  onTab: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _customAppBarDesktop extends StatelessWidget {
  //const _customAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _appBarButtons(
                  txt: 'Home',
                  onTab: () {},
                ),
                _appBarButtons(
                  txt: 'Tv Shows',
                  onTab: () {},
                ),
                _appBarButtons(
                  txt: 'Movies',
                  onTab: () {},
                ),
                _appBarButtons(
                  txt: 'Lates',
                  onTab: () {},
                ),
                _appBarButtons(
                  txt: 'My List',
                  onTab: () {},
                ),

              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: (){},
                ),
                _appBarButtons(
                  txt: 'Kids ',
                  onTab: () {},
                ),
                _appBarButtons(
                  txt: 'DvD',
                  onTab: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: (){},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: (){},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
