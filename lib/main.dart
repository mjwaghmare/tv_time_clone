import 'package:flutter/material.dart';
import 'package:tv_time_clone/screens/Discover/discover_section.dart';
import 'package:tv_time_clone/screens/Movies/movies_section.dart';
import 'package:tv_time_clone/screens/Profile/profile_section.dart';
import 'package:tv_time_clone/screens/shows/shows_section.dart';

import 'screens/utils/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TvTime Clone',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List _children = [const Shows(), const Movies(), const Discover(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: _bottomNavBar(_currentIndex),
    );
  }

  _bottomNavBar(_currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor.withOpacity(0.5),
      onTap: onTabTapped,
      backgroundColor: AppColors.blackColor,
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Shows',
              child: Icon(Icons.live_tv_rounded),
            ),
            label: 'Shows'),
        BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Movies',
              child: Icon(Icons.movie_sharp),
            ),
            label: 'Movies'),
        BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Discover',
              child: Icon(Icons.search),
            ),
            label: 'Discover'),
        BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Profile',
              child: Icon(Icons.person),
            ),
            label: 'Profile')
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
