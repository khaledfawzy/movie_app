import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/watchlist/presentation/manager/watch_list_cubit/watch_list_cubit.dart';
import '../../core/utils/color_manger.dart';
import '../browse/presentation/pages/browser_screen.dart';
import '../home/presentation/pages/home_screen.dart';
import '../search/presentation/pages/search_screen.dart';
import '../watchlist/presentation/pages/watch_list_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "lay";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> taps = [
    const HomeScreen(),
    const SearchScreen(),
    const BrowseScreen(),
    const WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          if (currentIndex == 3) {
            BlocProvider.of<WatchListCubit>(context).fetchMoviesFromWatchList();
          }
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
