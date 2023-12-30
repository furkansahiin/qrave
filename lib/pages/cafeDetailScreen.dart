import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class CafeDetailScreen extends StatelessWidget {
  final String imagePath;
  final String cafeName;
  final String address;

  const CafeDetailScreen({
    Key? key,

    required this.imagePath,
    required this.cafeName,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: cafeName.text.make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cafeName.text.bold.size(24).make(),
                  SizedBox(height: 8),
                  'Adres: $address'.text.size(18).make(),
                ],
              ),
            ),
            Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cafeName.text.bold.size(24).make(),
                  SizedBox(height: 8),
                  'Adres: $address'.text.size(18).make(),
                ],
              ),
            ),
            Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cafeName.text.bold.size(24).make(),
                  SizedBox(height: 8),
                  'Adres: $address'.text.size(18).make(),
                ],
              ),
            ),
            // Diğer detaylar buraya eklenebilir
          ],
        ),
      ),
    );
  }
}
