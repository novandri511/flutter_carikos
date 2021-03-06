import 'package:flutter/material.dart';
import 'package:flutter_realapp/pages/home_page.dart';
import 'package:flutter_realapp/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(alignment: Alignment.bottomCenter, child: Image.asset('assets/images/splash.png')),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Find Cozy House to Stay and Happy',
                    style: blackTextStyle.copyWith(fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Stop membuang banyak waktu pada tempat yang tidak habitable',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      height: 50,
                      width: 210,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomePage(),
                            ),);
                        },
                        color: purpleColor,
                        child: Text(
                          'Explore Now',
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
