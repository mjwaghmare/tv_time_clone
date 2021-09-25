import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ShowsWatchList extends StatefulWidget {
  const ShowsWatchList({Key key}) : super(key: key);

  @override
  _ShowsWatchListState createState() => _ShowsWatchListState();
}

class _ShowsWatchListState extends State<ShowsWatchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "Shows Watch List",
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
