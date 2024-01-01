import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/bgimage.jpg"),
        fit: BoxFit.cover,
      ),
    ),
        child: child,
  );
}

Widget bgWidgethome({Widget? child}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/bghomeimage.jpg"),
        fit: BoxFit.cover,
      ),
    ),
        child: child,
  );
}