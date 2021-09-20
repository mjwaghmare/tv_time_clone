import 'package:flutter/material.dart';
import 'package:tv_time_clone/screens/utils/app_colors.dart';

class Movies extends StatefulWidget {
  const Movies({Key key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Text(
          'MOVIES',
          style: TextStyle(color: AppColors.yellowColor, fontSize: 32),
        ),
      ),
    );
  }
}
