import 'package:flutter/material.dart';
import 'package:tv_time_clone/screens/utils/app_colors.dart';

class MoviesUpcoming extends StatefulWidget {
  const MoviesUpcoming({Key key}) : super(key: key);

  @override
  _MoviesUpcomingState createState() => _MoviesUpcomingState();
}

class _MoviesUpcomingState extends State<MoviesUpcoming> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "Movies Upcoming",
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
