import 'package:flutter/material.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/admin.jpg',
  'assets/admin.jpg',
  'assets/admin.jpg',
  'assets/admin.jpg',
  'assets/admin.jpg',
];

class AboutUs extends StatelessWidget {
  final UserModel user;

  const AboutUs({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'E-Care',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'about us',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(165.0, 12.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: CarouselSlider(
                options: CarouselOptions(),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                              child: Image.asset(item,
                                  fit: BoxFit.cover, width: 800)),
                        ))
                    .toList(),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  'With eCare you can access your medical records, email your care team, schedule appointments, check in to your appointment, request prescription refills and more. Trouble with your account? Call 206.520.8963.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]));
  }
}
