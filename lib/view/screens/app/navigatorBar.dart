import 'package:bottom_bar/bottom_bar.dart';
import 'package:ecommerce_app/view/screens/app/cart/cart_screen.dart';
import 'package:ecommerce_app/view/screens/app/favorite/favorite_screen.dart';
import 'package:ecommerce_app/view/screens/app/home/home/home_screen.dart';
import 'package:ecommerce_app/view/screens/app/notification/notification_screen.dart';
import 'package:ecommerce_app/view/screens/app/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class navigator extends StatefulWidget {
  navigator({super.key});

  @override
  State<navigator> createState() => _navigatorState();
}

class _navigatorState extends State<navigator> {
  final _pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: currentIndex,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => currentIndex = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color(0xFF8C6658),
            activeTitleColor: Color(0xFF8C6658),
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
            activeColor: Colors.red,
          ),
          BottomBarItem(
              icon: Icon(Icons.card_travel),
              title: Text('Cart'),
              backgroundColorOpacity: 0.1,
              activeColor: Color(0xFFA8886C),
              activeTitleColor: Color(0xFFA8886C).withOpacity(0.7)),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: Colors.black,
            activeIconColor: Colors.black,
            activeTitleColor: Colors.black,
          ),
        ],
      ),
      body: PageView(

        controller: _pageController,
        children: [
          HomeScreen(),
          FavoriteScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
