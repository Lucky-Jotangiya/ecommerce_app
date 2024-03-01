import 'package:ecommerce/cart_page.dart';
import 'package:ecommerce/home_page.dart';
import 'package:ecommerce/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomNav extends StatefulWidget {
  int i;

  BottomNav(this.i, {super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.i == 0) {
      selectedItemPosition = 0;
    }
    if (widget.i == 1) {
      selectedItemPosition = 1;
    }
    if (widget.i == 2) {
      selectedItemPosition = 2;
    }
    if (widget.i == 3) {
      selectedItemPosition = 3;
    }
    if (widget.i == 4) {
      selectedItemPosition = 4;
    }
    setState(() {});
  }

  List pages = [
    HomePage(),
    Center(child: Text('heart')),
    CartPage(),
    ProductPage(),
    Center(child: Text('profile')),
  ];

  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  int selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;
  Color unselectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: pages[selectedItemPosition],
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 60,
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: unselectedColor,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: selectedItemPosition,
        onTap: (index) => setState(() => selectedItemPosition = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'tickets'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'calendar'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_list), label: 'microphone'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: 'search')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
