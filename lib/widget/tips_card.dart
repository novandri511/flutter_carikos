import 'package:flutter/material.dart';
import 'package:flutter_realapp/models/tips.dart';
import 'package:flutter_realapp/theme.dart';

class TipsCard extends StatelessWidget {
  final Guide tips;
  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.headline,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 4
            ),
            Text(
              tips.date,
              style: greyTextStyle.copyWith(fontSize: 14),
            ),
           
          ],
        ),
         Spacer(),
            IconButton(icon: Icon(
              Icons.chevron_right, 
              color: greyColor,
            ), onPressed: (){})
      ],
    );
  }
}
