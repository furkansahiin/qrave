import 'package:flutter/material.dart';

AppBar homepageAppbar() {
  return AppBar(
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          // TODO: Implement search functionality
        },
      ),
      IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () {
          // TODO: Implement account functionality
        },
      ),
    ],
  );
}
