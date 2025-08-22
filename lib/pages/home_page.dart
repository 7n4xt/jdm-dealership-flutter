import 'package:e_shop_flutter/components/bottom_nav_bar.dart';
import 'package:e_shop_flutter/pages/cart_page.dart';
import 'package:e_shop_flutter/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void navigateBottomBar(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    final List<Widget> _pages = [const ShopPage(), const CartPage()];

    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/images/car-stainless-logo-png.webp',
                height: 200,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
