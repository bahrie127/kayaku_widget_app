import 'package:flutter/material.dart';
import 'package:kayaku_widget_app/models/category.dart';
import 'package:kayaku_widget_app/navigation/history_page.dart';
import 'package:kayaku_widget_app/navigation/home_page.dart';
import 'package:kayaku_widget_app/navigation/order_page.dart';
import 'package:kayaku_widget_app/navigation/second_page.dart';
import 'package:kayaku_widget_app/navigation/setting_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;
  void handleTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const HomePage(),
    const OrderPage(),
    const HistoryPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      // appBar: AppBar(title: const Text('First Page')),
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Order',
          ),
          //history
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: handleTap,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex, // Set the initial index to 0 (Home)
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        iconSize: 24,
        backgroundColor: Colors.white,
        elevation: 5,
        selectedIconTheme: IconThemeData(size: 30, color: Colors.deepPurple),
        unselectedIconTheme: IconThemeData(size: 24, color: Colors.grey),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
