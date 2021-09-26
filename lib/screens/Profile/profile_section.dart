import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tv_time_clone/Data/data.dart';
import 'package:tv_time_clone/screens/utils/widgets.dart';

import '../utils/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xff181818),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: _size.height * 0.38,
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: _size.height * 0.30,
                            child: PageView.builder(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _selectedPage = index;
                                  });
                                  _pageController.animateToPage(
                                    _selectedPage,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.ease,
                                  );
                                },
                                itemCount: 2,
                                itemBuilder: (ctx, index) {
                                  return SizedBox(
                                    height: _size.height * 0.30,
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Image.asset(
                                              "assets/images/profile_banner.jpg",
                                              fit: BoxFit.cover,
                                              height: _size.height * 0.30,
                                            ),
                                            //bio page view
                                            if (index == 1) ...{
                                              Container(
                                                height: _size.height * 0.30,
                                                color: Colors.black.withOpacity(0.5),
                                                child: const Center(
                                                  child: Text(
                                                    'Teen Wolf 🐺',
                                                    style: TextStyle(color: AppColors.whiteColor, fontSize: 24),
                                                  ),
                                                ),
                                              )
                                            } else ...{
                                              const SizedBox(),
                                            },
                                            //Question mark
                                            if (index == 0) ...{
                                              Positioned(
                                                  top: 15,
                                                  left: 15,
                                                  child: Container(
                                                    padding: const EdgeInsets.only(left: 4, top: 2),
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black.withOpacity(0.6),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      "?",
                                                      style: TextStyle(color: AppColors.whiteColor, fontSize: 23),
                                                    ),
                                                  ))
                                            } else ...{
                                              const SizedBox(),
                                            },
                                            //Notification
                                            if (index == 0) ...{
                                              Positioned(
                                                  top: 15,
                                                  right: 15,
                                                  child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors.yellowColor,
                                                      ),
                                                      alignment: Alignment.center,
                                                      child: const Icon(
                                                        Icons.notifications_rounded,
                                                        color: AppColors.blackColor,
                                                      )))
                                            } else ...{
                                              const SizedBox()
                                            },
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                      //Profile Image
                      Positioned(
                          left: _size.width / 2 - 60,
                          right: _size.width / 2 - 60,
                          bottom: _size.height * 0.02,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: AppColors.whiteColor,
                                width: 3,
                              ),
                            ),
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                                "assets/images/profile_image.PNG",
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                //Profile
                SizedBox(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 35,
                            child: Image.asset(
                              "assets/images/ind_flag.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "Mj",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.share,
                            color: AppColors.whiteColor,
                            size: 19,
                          )
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        width: 90,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              // returns ButtonStyle
                              primary: AppColors.greyColor,
                              onPrimary: AppColors.blackColor,
                              shape: const StadiumBorder()),
                          child: const Text(
                            "EDIT",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                //analysis data
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          timeCard(_size, "TV", "04", "01", "15"),
                          watchedCard(_size, "EPISODES", "3.7K"),
                          timeCard(_size, "MOVIE", "00", "27", "08"),
                          watchedCard(_size, "MOVIES", "358"),
                        ],
                      )),
                ),
                //SHOWS
                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: _size.height * 0.4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Shows",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          seeAllButton(),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: _size.width * 0.6,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: showsList.length,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                              splashColor: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(6.0),
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                height: _size.height * 0.6,
                                width: _size.height * 0.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.asset(
                                    "assets/images/shows/show_$i.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                //MOVIES
                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: _size.height * 0.4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Movies",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          seeAllButton(),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: _size.width * 0.6,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: moviesList.length,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                              splashColor: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(6.0),
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                height: _size.height * 0.6,
                                width: _size.height * 0.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.asset(
                                    "assets/images/movies/movie_$i.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //Details
                detailsTile("Custom lists", "0"),
                detailsTile("Followers", "12"),
                detailsTile("Following", "14"),
                detailsTile("Comments", "0"),
                detailsTile("Stats", ""),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        // returns ButtonStyle
                        primary: AppColors.greyColor,
                        onPrimary: AppColors.blackColor,
                        shape: const StadiumBorder()),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.settings,
                          size: 20,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "SETTINGS",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          )),
    );
  }

  InkWell detailsTile(String title, String value) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: AppColors.greyColor),
          ),
        ),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppColors.whiteColor, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    value,
                    style: const TextStyle(color: AppColors.whiteColor, fontSize: 18),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.whiteColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding timeCard(Size _size, String name, String months, String day, String hours) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 8.0),
      child: Container(
        padding: const EdgeInsets.all(2.0),
        width: _size.width * 0.55,
        height: _size.width * 0.26,
        decoration: BoxDecoration(color: const Color(0xff363636), borderRadius: BorderRadius.circular(6.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "$name TIME",
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Text(
                        months,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: AppColors.yellowColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "months",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: AppColors.yellowColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "day",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Text(
                        hours,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: AppColors.yellowColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "hours",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding watchedCard(Size _size, String name, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 8.0),
      child: Container(
        width: _size.width * 0.55,
        height: _size.width * 0.26,
        decoration: BoxDecoration(color: const Color(0xff363636), borderRadius: BorderRadius.circular(6.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$name WATCHED",
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7.0),
            Text(
              value,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: AppColors.yellowColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
