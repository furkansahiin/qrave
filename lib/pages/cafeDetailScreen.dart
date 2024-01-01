import 'package:flutter/material.dart';
import 'package:qrave/components/bgComponents.dart';
import 'package:qrave/components/buttonsComponents.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: cafeName.text.make(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath, height: 220, width: (context.screenWidth * 1), fit: BoxFit.contain),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cafeName.text.bold.size(24).make(),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ourButton(
                          title: 'Cafe Bilgileri',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Cafe Bilgileri'),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Cafe Adı: $cafeName'),
                                      Text('Adres: $address'),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Kapat'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          textColor: Colors.white,
                          color: Colors.red,
                        ),
                        ourButton(
                          title: 'Yol Tarifi Al',
                          onPressed: () async{
                           
                           String mapsUrl = 'https://www.google.com/maps/search/?api=1&query=$address';

                            if (await canLaunchUrl(Uri.parse(mapsUrl))) {
                              await launchUrl(Uri.parse(mapsUrl));
                            } else {
                              print('Could not launch $mapsUrl');
                            }
                          },
                          textColor: Colors.white,
                          color: Colors.red,
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
