import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../pages/cafeDetailScreen.dart';

class NearCafeCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        buildCafeCard(context, 'assets/images/image1.jpg', 'Cafe 1', 'Adres 1'),
        buildCafeCard(context, 'assets/images/image2.jpg', 'Cafe 2', 'Adres 2'),
        buildCafeCard(context, 'assets/images/image3.jpg', 'Cafe 3', 'Adres 3'),
        buildCafeCard(context, 'assets/images/image1.jpg', 'Cafe 4', 'Adres 4'),
        buildCafeCard(context, 'assets/images/image2.jpg', 'Cafe 5', 'Adres 5'),
        buildCafeCard(context, 'assets/images/image3.jpg', 'Cafe 6', 'Adres 6'),
      ],
      options: CarouselOptions(
        height: 120,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }

}Widget buildCafeCard(BuildContext context, String imagePath, String cafeName, String address) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CafeDetailScreen(
            imagePath: imagePath,
            cafeName: cafeName,
            address: address,
          ),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: Row(
        children: [
          Card(
            child: Container(
              width: 150, // İstediğiniz genişliği belirleyin
              height: 150, // İstediğiniz yüksekliği belirleyin
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cafeName.text.bold.size(18).make(),
                SizedBox(height: 8),
                'Adres: $address'.text.size(14).gray500.make(),
              ],
            ),
          ),
        ],
      ),
    ),
  ).box.roundedLg.color(const Color.fromARGB(255, 255, 248, 181)).make();
}
