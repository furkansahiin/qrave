import 'package:flutter/material.dart';

import '../pages/users/loginPageScreen.dart';

AppBar homepageAppbar() {
  return AppBar(
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          loginPageScreen();
        },
      ),
      IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () {
          loginPageScreen();
        },
      ),
    ],
  );
}
