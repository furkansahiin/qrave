import 'package:flutter/material.dart';
import 'package:qrave/consts/colors.dart';
import 'package:qrave/consts/language.dart';
import 'package:qrave/main.dart';
import 'package:qrave/pages/homePageScreen.dart';
import 'package:qrave/pages/users/loginPageScreen.dart';
import 'package:qrave/pages/users/singUpPageScreen.dart';
export 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: appcolorred),
        ),
        // fontFamily: regular,
      ),
      
      
      getPages: [
        GetPage(name: '/', page: () => HomePageScreen()),
        // GetPage(name: '/home', page: () => DashboardFragments()),
        // GetPage(name: '/admin', page: () => AdminDashboardFragments()),
        GetPage(name: '/login', page: () =>  const loginPageScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        // GetPage(name: '/editprofile', page: () => const ProfileEditScreen()),
        // GetPage(name: '/ayarlar', page: () => const SettingsScreen()),
        // GetPage(name: '/search', page: () => const SearchFragments()),
        // GetPage(name: '/profile', page: () => ProfileFragmentsScreen()),
        // GetPage(name: '/notification', page: () => const NotificationFragments()),
        // GetPage(name: '/favorite', page: () => const FavoriteFragments()),
      ],
      home: HomePageScreen(),
    );
  }
}
