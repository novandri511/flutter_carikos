import 'package:flutter/material.dart';
import 'package:flutter_realapp/theme.dart';
import 'home_page.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/404.png'),
          SizedBox(height: 70),
          Text(
            'Where are you going?',
            style: blackTextStyle.copyWith(fontSize: 24),
          ),
          SizedBox(height: 14),
          Text('Seems like the page that you were requested is already gone',
              style: greyTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center),
          SizedBox(height: 50),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - (2 * 83),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
              color: purpleColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              child: Text(
                'Back to Home',
                style: whiteTextStyle.copyWith(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
