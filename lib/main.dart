import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/Discover/discover_section.dart';
import 'screens/Movies/movies_section.dart';
import 'screens/Profile/profile_section.dart';
import 'screens/shows/shows_section.dart';
import 'screens/utils/app_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.blackColor, // status bar color
  ));
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
      unselectedItemColor: AppColors.whiteColor.withOpacity(0.4),
      onTap: onTabTapped,
      backgroundColor: AppColors.blackColor,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Shows',
              child: ElasticIn(
                child: const Icon(
                  Icons.live_tv_rounded,
                  size: 27,
                ),
              ),
            ),
            label: 'Shows'),
        BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Movies',
              child: ElasticIn(
                child: const Icon(
                  Icons.movie_sharp,
                  size: 27,
                ),
              ),
            ),
            label: 'Movies'),
        BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Discover',
              child: ElasticIn(
                child: const Icon(
                  Icons.search,
                  size: 27,
                ),
              ),
            ),
            label: 'Discover'),
        BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Profile',
              child: ElasticIn(
                child: const Icon(
                  Icons.person,
                  size: 27,
                ),
              ),
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
