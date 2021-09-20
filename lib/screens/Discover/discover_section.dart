import 'package:flutter/material.dart';
import 'package:tv_time_clone/screens/utils/app_colors.dart';

class Discover extends StatefulWidget {
  const Discover({Key key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Text(
          'DISCOVER',
          style: TextStyle(color: AppColors.yellowColor, fontSize: 32),
        ),
      ),
    );
  }
}
