import 'package:flutter/material.dart';
import 'package:qrave/components/bgComponents.dart';
import 'package:qrave/components/googleAds.dart';
import 'package:qrave/consts/language.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/appbarComponent.dart';
import '../components/carouselComponent.dart';
// import '../components/googleAds.dart';
import '../components/listComponents.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return bgWidgethome(
      child: SafeArea(
        child: Scaffold(
          appBar: homepageAppbar(context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Yakın Mekanlar".text.bold.xl2.make().p(4),
                NearCafeCarousel(),
                5.heightBox,
                "Popüler Mekanlar".text.bold.xl2.make().p(4),
                PopulerCafeCarousel(),
                5.heightBox,
                // GoogleAdsContainer(),
                NearCafeCarousel(),
                30.heightBox,
              ],
                ),
                Column(
                  children: [
                  appname.text.bold.size(22).black.make(),
                  10.heightBox,
                  appversiyon.text.black.make(),
                  credits.text.black.make(),
                  30.heightBox,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}