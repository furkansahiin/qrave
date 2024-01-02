import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:qrave/pages/menuWidget.dart';

class CafeMenuLayout extends StatefulWidget {
  final List<MenuCategory> menuData;

  const CafeMenuLayout({
    Key? key,
    required this.menuData,
  }) : super(key: key);

  @override
  _CafeMenuLayoutState createState() => _CafeMenuLayoutState();
}

class _CafeMenuLayoutState extends State<CafeMenuLayout> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.menuData.first.categoryName;
  }

  @override
Widget build(BuildContext context) {
  return Column(
    children: [
      Flexible(
        child: ListView.builder(
          itemCount: widget.menuData.length,
          itemBuilder: (context, index) {
            final category = widget.menuData[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.heightBox,
                Text(category.categoryName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ...category.items.map((item) => MenuItemWidget(item: item)),
                if (index == widget.menuData.length - 1)
                  Column(
                    children: [
                      15.heightBox,
                      "Hello".text.xl3.make(),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    ],
  );
}
}
