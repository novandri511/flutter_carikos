import 'package:flutter/material.dart';
import 'package:flutter_realapp/theme.dart';

class BottomNav extends StatelessWidget {
  
  final String imageUrl;
  final bool isActive;

  BottomNav({this.imageUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Spacer(),
      Image.asset(this.imageUrl, width: 26),
      Spacer(),
      isActive ? Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
              color: purpleColor, borderRadius: BorderRadius.circular(1000))
              ) : Container()
    ]);
  }
}
