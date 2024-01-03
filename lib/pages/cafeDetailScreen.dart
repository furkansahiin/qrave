import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrave/components/bgComponents.dart';
import 'package:qrave/pages/cafeInformationPages.dart';
import 'package:qrave/pages/cafeimagewidget.dart';
import 'package:qrave/pages/menuWidget.dart';
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

    String jsonData = '''
      [
        {
          "categoryName": "Category 1",
          "items": [
            {
              "name": "Item 1",
              "description": "Description 1",
              "image": "image1.jpg",
              "price": 10.0,
              "numberOfPeople": 2
            },
            {
              "name": "Item 2",
              "description": "Description 2",
              "image": "image2.jpg",
              "price": 15.0
            }
          ]
        },
        {
          "categoryName": "Category 2",
          "items": [
            {
              "name": "Item 3",
              "description": "Description 3",
              "image": "image3.jpg",
              "price": 20.0,
              "numberOfPeople": 4
            },
            {
              "name": "Item 4",
              "description": "Description 4",
              "image": "image1.jpg",
              "price": 25.0
            }
          ]
        },{
          "categoryName": "Category 3",
          "items": [
            {
              "name": "Item 1",
              "description": "Description 1",
              "image": "image1.jpg",
              "price": 10.0,
              "numberOfPeople": 2
            },
            {
              "name": "Item 2",
              "description": "Description 2",
              "image": "image2.jpg",
              "price": 15.0
            }
          ]
        },
        {
          "categoryName": "Category 4",
          "items": [
            {
              "name": "Item 3",
              "description": "Description 3",
              "image": "image3.jpg",
              "price": 20.0,
              "numberOfPeople": 4
            },
            {
              "name": "Item 4",
              "description": "Description 4",
              "image": "image1.jpg",
              "price": 25.0
            }
          ]
        },{
          "categoryName": "Category 5",
          "items": [
            {
              "name": "Item 1",
              "description": "Description 1",
              "image": "image1.jpg",
              "price": 10.0,
              "numberOfPeople": 2
            },
            {
              "name": "Item 2",
              "description": "Description 2",
              "image": "image2.jpg",
              "price": 15.0
            }
          ]
        },
        {
          "categoryName": "Category 6",
          "items": [
            {
              "name": "Item 3",
              "description": "Description 3",
              "image": "image3.jpg",
              "price": 20.0,
              "numberOfPeople": 4
            },
            {
              "name": "Item 4",
              "description": "Description 4",
              "image": "image1.jpg",
              "price": 25.0
            }
          ]
        },{
          "categoryName": "Category 7",
          "items": [
            {
              "name": "Item 1",
              "description": "Description 1",
              "image": "image1.jpg",
              "price": 10.0,
              "numberOfPeople": 2
            },
            {
              "name": "Item 2",
              "description": "Description 2",
              "image": "image2.jpg",
              "price": 15.0
            }
          ]
        },
        {
          "categoryName": "Category 8",
          "items": [
            {
              "name": "Item 3",
              "description": "Description 3",
              "image": "image3.jpg",
              "price": 20.0,
              "numberOfPeople": 4
            },
            {
              "name": "Item 4",
              "description": "Description 4",
              "image": "image1.jpg",
              "price": 25.0
            }
          ]
        }
      ]
    ''';

    List<dynamic> menuData = json.decode(jsonData);
    List<MenuCategory> categories = menuData.map((data) => MenuCategory.fromJson(data)).toList();


    return bgWidget(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async{
                String mapsUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
                if (await canLaunchUrl(Uri.parse(mapsUrl))) {
                  await launchUrl(Uri.parse(mapsUrl));
                } else {
                  print('Could not launch $mapsUrl');
                }
              },
              child: Icon(Icons.directions),
            ),
        // appBar: AppBar(
        //   title: cafeName.text.make(),
        // ),
        body: SafeArea(
          child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: Container(),
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CafeImagesWidget(imageUrls: [imagePath, imagePath]),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.info)),
                    Tab(icon: Icon(Icons.menu_book)),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          children: [
            CafeInformationWidget(cafeName: cafeName, address: address),
            CafeMenuWidget(menuData: categories),
          ],
        ),
      ),
        ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

