import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../pages/cafeDetailScreen.dart';

class PopulerCafeCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildCafeList(context, 'assets/images/image1.jpg', 'Cafe 1', 'Merkez, Silahtarağa Cd. No:8, 34050 Eyüpsultan/İstanbul'),
          buildCafeList(context, 'assets/images/image2.jpg', 'Cafe 2', 'Adres 2'),
          buildCafeList(context, 'assets/images/image3.jpg', 'Cafe 3', 'Adres 3'),
          buildCafeList(context, 'assets/images/image1.jpg', 'Cafe 4', 'Adres 4'),
          buildCafeList(context, 'assets/images/image2.jpg', 'Cafe 5', 'Adres 5'),
          buildCafeList(context, 'assets/images/image3.jpg', 'Cafe 6', 'Adres 6'),
        ],
      ),
    );
  }
}

Widget buildCafeList(BuildContext context, String imagePath, String cafeName, String address) {
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
      child: Card(
        child: Container(
          width: 200,
          height: 275,
          child: Column(
            children: [
              Image.asset(imagePath, fit: BoxFit.cover, height: 150, width: double.infinity),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
      ),
    ),
  );
}
