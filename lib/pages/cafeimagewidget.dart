import 'package:flutter/material.dart';
import 'package:qrave/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CafeImagesWidget extends StatefulWidget {
  final List<String> imageUrls;

  const CafeImagesWidget({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  _CafeImagesWidgetState createState() => _CafeImagesWidgetState();
}

class _CafeImagesWidgetState extends State<CafeImagesWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          height: 300,
          child: PageView.builder(
            itemCount: widget.imageUrls.length,
            controller: PageController(
              initialPage: _currentIndex,
            ),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                widget.imageUrls[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.purple.withOpacity(0.5),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                // Favori butonu için yapılacak işlemleri ekleyin
              },
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.purple.withOpacity(0.5),
            ),
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                // Favori butonu için yapılacak işlemleri ekleyin
              },
            ),
          ),
        ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imageUrls.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: _currentIndex == index ? appcolorred : appcolor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}