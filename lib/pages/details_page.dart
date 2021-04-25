import 'package:flutter/material.dart';
import 'package:flutter_realapp/pages/error_page.dart';
import 'package:flutter_realapp/theme.dart';
import 'package:flutter_realapp/widget/facilities.dart';
import 'package:flutter_realapp/widget/rating.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_realapp/models/space.dart';
import 'package:flutter_realapp/widget/rating.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(children: [
              SizedBox(
                height: 328,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 604,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    // NOTE : PROPERTY NAME
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                space.name,
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(height: 2),
                              Text.rich(
                                TextSpan(
                                    text: '\$${space.harga}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: "/ month",
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16))
                                    ]),
                              ),
                            ],
                          ),
                          Row(
                            children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                child: RatingItem(
                                    index: index, rating: space.rating),
                              );
                            }).toList(),
                            //[

                            // SizedBox(width: 2),
                            // Image.asset(
                            //   'assets/images/Icon_star_solid.png',
                            //   width: 20,
                            // ),
                            // SizedBox(width: 2),
                            // Image.asset(
                            //   'assets/images/Icon_star_solid.png',
                            //   width: 20,
                            // ),
                            // SizedBox(width: 2),
                            // Image.asset(
                            //   'assets/images/Icon_star_solid.png',
                            //   width: 20,
                            // ),
                            // SizedBox(width: 2),
                            // Image.asset(
                            //   'assets/images/Icon_star_solid.png',
                            //   width: 20,
                            //   color: greyColor,
                            // )
                            //  ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    // NOTE : MAIN FACILITIES
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Main Facilities',
                            style: blackTextStyle.copyWith(fontSize: 16),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainFacilites(
                                total: space.number_of_kitchens,
                                imageUrl: 'assets/images/icon_kitchen.png',
                                name: ' kitchen',
                              ),
                              MainFacilites(
                                total: space.number_of_bedrooms,
                                imageUrl: 'assets/images/icon_bed.png',
                                name: ' bedroom',
                              ),
                              MainFacilites(
                                total: space.number_of_cupboards,
                                imageUrl: 'assets/images/icon_big.png',
                                name: ' Big Lemari',
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Photos',
                                style: blackTextStyle.copyWith(fontSize: 16),
                              ),
                              SizedBox(height: 12),
                              Container(
                                height: 88,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: space.photos.map((item) {
                                      return Container(
                                        margin: EdgeInsets.only(left: 24),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(
                                            item,
                                            height: 88,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }).toList()
                                    //VERSI MANUAL
                                    // [
                                    //   Image.asset(
                                    //     'assets/images/pic1.png',
                                    //     height: 88,
                                    //   ),
                                    //   SizedBox(width: 18),
                                    //   Image.asset(
                                    //     'assets/images/photos2.png',
                                    //     height: 88,
                                    //   ),
                                    //   SizedBox(width: 18),
                                    //   Image.asset(
                                    //     'assets/images/photos3.png',
                                    //     height: 88,
                                    //   )
                                    // ],
                                    ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    //Note: LOCATION
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: blackTextStyle.copyWith(fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    space.address,
                                    style: greyTextStyle.copyWith(fontSize: 14),
                                  ),
                                  Text(
                                    space.negara,
                                    style: greyTextStyle.copyWith(fontSize: 14),
                                  )
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    // launch(
                                    //     'https://goo.gl/maps/xt1m6RZKuhu2WDuQ7');
                                    launchUrl(space.map_url);
                                  },
                                  child: Image.asset('assets/images/map.png',
                                      width: 40))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    // NOTE : BOOK NOW
                    Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        // decoration: BoxDecoration(
                        //     color: purpleColor,
                        //     borderRadius: BorderRadius.circular(23)),
                        child: RaisedButton(
                          onPressed: () {
                            launch('tel:${space.phone}');
                          },
                          color: purpleColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle,
                          ),
                        )),
                  ],
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/btn_back.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Image.asset(
                      'assets/images/btn_wishlist.png',
                      width: 40,
                      height: 40,
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
