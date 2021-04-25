import 'package:flutter/material.dart';
import 'package:flutter_realapp/models/space.dart';
import 'package:flutter_realapp/pages/details_page.dart';
import 'package:flutter_realapp/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(space),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
                height: 110,
                width: 130,
                child: (Stack(
                  children: [
                    Image.network(
                      space.imageUrl,
                      height: 110,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30))),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Icon_star_solid.png',
                              width: 22,
                              height: 22,
                            ),
                            Text(
                              "${space.rating}/5",
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            )
                          ],
                        )),
                      ),
                    )
                  ],
                ))),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                    text: '\$${space.harga}',
                    style: purpleTextStyle.copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                          text: "/ month",
                          style: greyTextStyle.copyWith(fontSize: 16))
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Bandung, Germany",
                style: greyTextStyle.copyWith(fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
