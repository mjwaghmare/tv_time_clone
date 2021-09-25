import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MoviesWatchList extends StatefulWidget {
  const MoviesWatchList({Key key}) : super(key: key);

  @override
  _MoviesWatchListState createState() => _MoviesWatchListState();
}

class _MoviesWatchListState extends State<MoviesWatchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "Movies Watch List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.yellowColor,
          ),
        ),
      ),
    );
  }
}
