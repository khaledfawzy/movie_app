import 'package:flutter/material.dart';

 import '../core/utils/color_manger.dart';
import '../features/browser/presentation/pages/browser_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/search/presentation/pages/search_screen.dart';
import '../features/watchlist/presentation/pages/watch_list_screen.dart';


class HomeLayout extends StatefulWidget {
  static const String routeName = "lay";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> taps = [
    const HomeScreen(),
    const SearchScreen(),
    const BrowserScreen(),
    const WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: primarycolor),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "search",
              backgroundColor: primarycolor),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: "Browser",
              backgroundColor: primarycolor),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Watchlist",
              backgroundColor: primarycolor),
        ],
        selectedItemColor: yellowColor,
        unselectedItemColor: onTabColor,
      ),
      body: taps[currentIndex],
    );
  }
}
