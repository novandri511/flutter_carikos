import 'package:flutter/material.dart';
import 'package:flutter_realapp/models/city.dart';
import 'package:flutter_realapp/theme.dart';

class CityCard extends StatelessWidget {
  final City dity;
  CityCard(this.dity);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  dity.imageUrl,
                  height: 102,
                  width: 120,
                  fit: BoxFit.cover,
                ),
               dity.isPopular ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(color: purpleColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30)
                    )),
                    child: Center(child: Image.asset('assets/images/Icon_star_solid.png',
                    width: 22,
                    height: 22,)),
                  ),
                ) : Container()
              ],
            ),
            SizedBox(height: 11),
            Text(
              dity.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
