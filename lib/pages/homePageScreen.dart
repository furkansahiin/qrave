import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/appbarComponent.dart';
import '../components/carouselComponent.dart';
import '../components/googleAds.dart';
import '../components/listComponents.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homepageAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              "Yakın Mekanlar".text.bold.xl2.align(TextAlign.left).make(),
              10.heightBox,
              NearCafeCarousel(),
              20.heightBox,
              "Popüler Mekanlar".text.bold.xl2.align(TextAlign.left).make(),
              10.heightBox,
              // PopulerCafeCarousel(),
              10.heightBox,
              // GoogleAdsContainer(),
              // NearCafeCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}