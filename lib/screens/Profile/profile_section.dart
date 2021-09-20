import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Text(
          'PROFILE',
          style: TextStyle(color: AppColors.yellowColor, fontSize: 32),
        ),
      ),
    );
  }
}
