import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  //const VerticalIconButton({Key? key}) : super(key: key);
  final IconData icon;

  final String title;

  final Function ontap;

  const VerticalIconButton({Key key, this.icon, this.title, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Icon(icon , color: Colors.white, ),
          Text(
            title,
            style: const TextStyle(fontSize:20, color: Colors.white),
          )
        ],
      ),
      onTap: ontap,
    );
  }
}
