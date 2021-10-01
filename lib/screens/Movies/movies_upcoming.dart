import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Data/data.dart';
import '../../models/models.dart';
import '../utils/app_colors.dart';

class MoviesUpcoming extends StatefulWidget {
  const MoviesUpcoming({Key key}) : super(key: key);

  @override
  _MoviesUpcomingState createState() => _MoviesUpcomingState();
}

class _MoviesUpcomingState extends State<MoviesUpcoming> {
  List<Movies> mList = [];

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() {
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      setState(() {
        mList = moviesList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return mList.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.yellowColor),
            ),
          )
        : Container(
            margin: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: mList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                crossAxisSpacing: 3.5,
                mainAxisSpacing: 3.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Image.asset(
                      mList[index].moviePosterUrl,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: AppColors.blackColor.withOpacity(0.3),
                    ),
                    Positioned(
                        bottom: 8,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mList[index].daysBeforeRelease,
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              "Days",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ))
                  ],
                );
              },
            ),
          );
  }
}
