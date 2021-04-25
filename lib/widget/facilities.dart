import 'package:flutter/material.dart';
import 'package:flutter_realapp/theme.dart';

class MainFacilites extends StatelessWidget {
  final int total;
  final String imageUrl;
  final String name;

  MainFacilites({this.total, this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: 32,
            ),
            SizedBox(
              height: 8,
            ),
            Text.rich(
              TextSpan(
                  text: '$total',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: name, style: greyTextStyle.copyWith(fontSize: 16))
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
