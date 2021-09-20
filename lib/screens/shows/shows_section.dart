import 'package:flutter/material.dart';
import 'package:tv_time_clone/screens/utils/app_colors.dart';

class Shows extends StatefulWidget {
  const Shows({Key key}) : super(key: key);

  @override
  _ShowsState createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Text(
          'SHOWS',
          style: TextStyle(color: AppColors.yellowColor, fontSize: 32),
        ),
      ),
    );
  }
}
