import 'package:flutter/material.dart';
import 'package:flutter_realapp/models/city.dart';
import 'package:flutter_realapp/models/space.dart';
import 'package:flutter_realapp/models/tips.dart';
import 'package:flutter_realapp/provider/space_provider.dart';
import 'package:flutter_realapp/theme.dart';
import 'package:flutter_realapp/widget/bottomnav.dart';
import 'package:flutter_realapp/widget/city_card.dart';
import 'package:flutter_realapp/widget/space_card.dart';
import 'package:flutter_realapp/widget/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    // spaceProvider.getSpaces();
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: ListView(
            // NOTE: HEADER/TITLE
            children: [
              SizedBox(height: edge),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Mencari Kosan yang cozy',
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 30),
              // NOTE: POPULAR CITIES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text("Popular Cities",
                    style: blackTextStyle.copyWith(fontSize: 16)),
              ),
              SizedBox(height: 16),
              Container(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CityCard(City(
                          id: 1,
                          name: 'Manado',
                          imageUrl: 'assets/images/popular_city1.png')),
                      SizedBox(width: 20),
                      CityCard(City(
                          id: 2,
                          name: 'Bandung',
                          imageUrl: 'assets/images/popular_city2.png',
                          isPopular: true)),
                      SizedBox(width: 20),
                      CityCard(City(
                          id: 3,
                          name: 'Surabaya',
                          imageUrl: 'assets/images/popular_city3.png')),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              //NOTE: RECOMMENDED SPACES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Recommended Space",
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: FutureBuilder(
                  future: spaceProvider.getSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;
                      int index = 0;
                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                              margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                              child: SpaceCard(item));
                        }).toList(),

                        // SpaceCard(Space(
                        //     id: 1,
                        //     name: 'Kuretakeso Hott',
                        //     imageUrl: 'assets/images/space1.png',
                        //     harga: 52,
                        //     kota: 'Bandung',
                        //     negara: 'Germany',
                        //     rating: 4)),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // SpaceCard(Space(
                        //     id: 2,
                        //     name: 'Roemah Nenek',
                        //     imageUrl: 'assets/images/space2.png',
                        //     harga: 11,
                        //     kota: 'Bogor',
                        //     negara: 'Seattle',
                        //     rating: 5)),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // SpaceCard(Space(
                        //     id: 3,
                        //     name: 'Darrling How',
                        //     imageUrl: 'assets/images/space3.png',
                        //     harga: 20,
                        //     kota: 'Jakarta',
                        //     negara: 'Indonesia',
                        //     rating: 3)),
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  },
                ),
              ),
              SizedBox(height: 30),
              // NOTE: TIPS & GUIDANCE
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "TIPS & GUIDANCE",
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Column(children: [
                    TipsCard(Guide(
                        id: 1,
                        imageUrl: 'assets/images/guide2.png',
                        headline: 'City Guidelines',
                        date: 'Updated 20 Apr')),
                    SizedBox(height: 20),
                    TipsCard(Guide(
                        id: 2,
                        imageUrl: 'assets/images/guide1.png',
                        headline: 'Jakarta Fairship',
                        date: 'Updated 11 Dec')),
                  ])),
              SizedBox(height: 50 + edge),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          BottomNav(
            imageUrl: 'assets/images/Icon_home_solid.png',
            isActive: true,
          ),
          BottomNav(
            imageUrl: 'assets/images/Icon_mail_grey.png',
            isActive: false,
          ),
          BottomNav(
            imageUrl: 'assets/images/Icon_card_grey.png',
            isActive: false,
          ),
          BottomNav(
            imageUrl: 'assets/images/Icon_love_grey.png',
            isActive: false,
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
