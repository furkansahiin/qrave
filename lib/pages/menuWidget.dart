
import 'package:flutter/material.dart';
import 'package:qrave/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class MenuItem {
  final String name;
  final String description;
  final String image;
  final double price;
  final int? numberOfPeople; // Kişi sayısı, varsa

  MenuItem({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.numberOfPeople,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'].toDouble(),
      numberOfPeople: json['numberOfPeople'],
    );
  }
}

class MenuCategory {
  final String categoryName;
  final List<MenuItem> items;

  MenuCategory({
    required this.categoryName,
    required this.items,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    List<MenuItem> items = (json['items'] as List)
        .map((item) => MenuItem.fromJson(item))
        .toList();

    return MenuCategory(
      categoryName: json['categoryName'],
      items: items,
    );
  }
}

class CafeMenuWidget extends StatefulWidget {
  final List<MenuCategory> menuData;

  const CafeMenuWidget({
    Key? key,
    required this.menuData,
  }) : super(key: key);

  @override
  _CafeMenuWidgetState createState() => _CafeMenuWidgetState();
}

class _CafeMenuWidgetState extends State<CafeMenuWidget> {
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
        MenuCategoriesWidget(
          categories: widget.menuData.map((category) => category.categoryName).toList(),
          onCategorySelected: (category) {
            setState(() {
              selectedCategory = category;
            });
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.menuData.length,
            itemBuilder: (context, index) {
              final category = widget.menuData[index];
              if (category.categoryName == selectedCategory) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.heightBox,
                    ...category.items.map((item) => MenuItemWidget(item: item)),
                  ],
                );
              } else {
                return SizedBox.shrink(); // Seçilmeyen kategoriyi boş bir widget ile gizle
              }
            },
          ),
        ),
      ],
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;

  const MenuItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8).copyWith(bottom: 0), 
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item.image.startsWith('http')
              ? Image.network(item.image, width: 100, height: 100, fit: BoxFit.cover)
              : Image.asset("assets/images/" + item.image, width: 100, height: 100, fit: BoxFit.cover),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(item.description),
                SizedBox(height: 10),
                Text('${item.price} TL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                if (item.numberOfPeople != null) Text('Kişi sayısı: ${item.numberOfPeople}'),
              ],
            ),
          ),
          5.heightBox,
        ],
      ),
    );
  }
}

class MenuCategoriesWidget extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  const MenuCategoriesWidget({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _MenuCategoriesWidgetState createState() => _MenuCategoriesWidgetState();
}

class _MenuCategoriesWidgetState extends State<MenuCategoriesWidget> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ActionChip(
              label: Text(widget.categories[index]),
              onPressed: () {
                setState(() {
                  selectedCategory = widget.categories[index];
                  widget.onCategorySelected(selectedCategory);
                });
              },
              backgroundColor: selectedCategory == widget.categories[index] ? appcolor : null,
            ),
            
          );
        },
      ),
    );
  }
}