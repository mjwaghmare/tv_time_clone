import 'package:flutter/material.dart';

import '../../Data/data.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';

class Discover extends StatefulWidget {
  const Discover({Key key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Search Bar
                const SizedBox(height: 10.0),
                searchBar(_size),
                //TOP SHOWS
                const SizedBox(height: 20.0),
                shows("Top shows for you", _size),
                const Divider(color: AppColors.greyColor),
                //MOVIES
                const SizedBox(height: 10.0),
                movies(_size),
                const Divider(color: AppColors.greyColor),
                //TOP SHOWS
                const SizedBox(height: 10.0),
                shows("Trending shows", _size),
                const Divider(color: AppColors.greyColor),
                //Discover
                const SizedBox(height: 20.0),
                discoverMore(_size),
                const Divider(color: AppColors.greyColor),
                //Recent Activity
                const SizedBox(height: 20.0),
                recentActivity(_size),
                const Divider(color: AppColors.greyColor),
              ],
            ),
          ),
        ));
  }

  Widget discoverMore(Size _size) {
    return InkWell(
      onTap: () {},
      splashColor: AppColors.greyColor,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0)),
        width: double.infinity,
        height: _size.height * 0.20,
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                  color: AppColors.yellowColor,
                ),
                width: double.infinity,
                height: _size.height * 0.10,
                child: Stack(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: showsList.length,
                      itemBuilder: (c, i) {
                        return Image.asset(
                          "assets/images/shows/show_$i.jpg",
                          height: _size.height * 0.10,
                          width: _size.width * 0.16,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0),
                        ),
                        color: AppColors.yellowColor.withOpacity(0.4),
                      ),
                      width: double.infinity,
                      height: _size.height * 0.10,
                    )
                  ],
                )),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
                color: AppColors.yellowColor,
              ),
              width: double.infinity,
              height: _size.height * 0.10,
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Discover more",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "New shows and movies are waiting for you",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: size.width,
      height: 50,
      child: Row(
        children: const [
          SizedBox(width: 10.0),
          Icon(
            Icons.search,
            color: AppColors.whiteColor,
          ),
          SizedBox(width: 4.0),
          Expanded(
            child: TextField(
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.name,
                cursorColor: AppColors.yellowColor,
                style: TextStyle(
                  color: AppColors.whiteColor,
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: AppColors.whiteColor,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                )),
          )
        ],
      ),
    );
  }

  Widget shows(String title, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: size.height * 0.4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
              ),
              seeAllButton(),
            ],
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            height: size.width * 0.6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: showsList.length,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: size.height * 0.6,
                  width: size.height * 0.2,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          "assets/images/shows/show_$i.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Container(
                            color: AppColors.blackColor.withOpacity(0.2),
                          )),
                      Positioned(
                        top: 8,
                        right: 15,
                        child: InkWell(
                          splashColor: AppColors.yellowColor,
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.5,
                                  color: AppColors.yellowColor,
                                ),
                                borderRadius: BorderRadius.circular(6.0)),
                            height: 30,
                            width: 30,
                            child: const Icon(
                              Icons.add,
                              color: AppColors.yellowColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget movies(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: size.height * 0.4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Trending movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
              ),
              seeAllButton(),
            ],
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            height: size.width * 0.6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: moviesList.length,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: size.height * 0.6,
                  width: size.height * 0.2,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          "assets/images/movies/movie_$i.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Container(
                            color: AppColors.blackColor.withOpacity(0.2),
                          )),
                      Positioned(
                        top: 8,
                        right: 15,
                        child: InkWell(
                          onTap: () {},
                          splashColor: AppColors.yellowColor,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.5,
                                  color: AppColors.yellowColor,
                                ),
                                borderRadius: BorderRadius.circular(6.0)),
                            height: 30,
                            width: 30,
                            child: const Icon(
                              Icons.add,
                              color: AppColors.yellowColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget recentActivity(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Activity",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            height: size.width * 0.6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: moviesList.length,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: size.height * 0.6,
                  width: size.width * 0.9,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          "assets/images/movies/movie_$i.jpg",
                          fit: BoxFit.cover,
                          height: size.height * 0.6,
                          width: size.width * 0.9,
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Container(
                            color: AppColors.blackColor.withOpacity(0.2),
                          )),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: InkWell(
                          onTap: () {},
                          splashColor: AppColors.yellowColor,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.5,
                                  color: AppColors.yellowColor,
                                ),
                                borderRadius: BorderRadius.circular(6.0)),
                            height: 30,
                            width: 30,
                            child: const Icon(
                              Icons.add,
                              color: AppColors.yellowColor,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColors.blackColor.withOpacity(0.2),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  moviesList[i].movieName,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  "${moviesList[i].movieGenre} - ${moviesList[i].movieYear}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        bottom: 10,
                        right: 15,
                        child: InkWell(
                          onTap: () {},
                          splashColor: AppColors.yellowColor,
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColors.blackColor.withOpacity(0.8),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "60%",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
