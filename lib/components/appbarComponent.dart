import 'package:flutter/material.dart';
import 'package:qrave/main.dart';

import '../pages/users/loginPageScreen.dart';

AppBar homepageAppbar(context) {
  return AppBar(
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          
        },
      ),
      IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () {
          Get.toNamed('/login');
        },
      ),
    ],
  );
}
