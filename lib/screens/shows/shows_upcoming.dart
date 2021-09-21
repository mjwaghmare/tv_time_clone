import 'package:flutter/material.dart';
import 'package:tv_time_clone/screens/utils/app_colors.dart';

class ShowsUpcoming extends StatefulWidget {
  const ShowsUpcoming({Key key}) : super(key: key);

  @override
  _ShowsUpcomingState createState() => _ShowsUpcomingState();
}

class _ShowsUpcomingState extends State<ShowsUpcoming> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "Shows Upcoming",
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
