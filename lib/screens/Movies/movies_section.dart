import 'package:flutter/material.dart';
import 'package:tv_time_clone/screens/Movies/movies_upcoming.dart';
import 'package:tv_time_clone/screens/Movies/movies_watch_list.dart';

import '../utils/app_colors.dart';

class Movies extends StatefulWidget {
  const Movies({Key key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: SizedBox(
                height: 50.0,
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: AppColors.yellowColor,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  indicatorColor: AppColors.whiteColor,
                  indicatorWeight: 4.0,
                  tabs: [
                    Text("WATCH LIST"),
                    Text("UPCOMING"),
                  ],
                ),
              ),
            ),
            body: TabBarView(children: [MoviesWatchList(), MoviesUpcoming()])),
      ),
    );
  }
}
