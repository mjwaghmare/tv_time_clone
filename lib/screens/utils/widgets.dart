import 'package:flutter/material.dart';

import 'app_colors.dart';

InkWell seeAllButton() {
  return InkWell(
    borderRadius: BorderRadius.circular(6.0),
    onTap: () {},
    child: const Padding(
      padding: EdgeInsets.all(6.0),
      child: Text(
        "SEE ALL",
        style: TextStyle(
          fontSize: 13,
          color: AppColors.yellowColor,
        ),
      ),
    ),
  );
}
