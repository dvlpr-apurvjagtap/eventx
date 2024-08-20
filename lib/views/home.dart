import 'package:eventx/views/add_screen.dart';
import 'package:eventx/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int currentPage = 0;
List navBody = [HomeScreen(), AddScreen()];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBody[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled),
              activeIcon: Icon(CupertinoIcons.add_circled_solid),
              label: "Add Event"),
        ],
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
