import 'package:flutter/material.dart';
import 'package:tv_time_clone/Data/data.dart';
import 'package:tv_time_clone/models/models.dart';

import '../utils/app_colors.dart';

class ShowsWatchList extends StatefulWidget {
  const ShowsWatchList({Key key}) : super(key: key);

  @override
  _ShowsWatchListState createState() => _ShowsWatchListState();
}

class _ShowsWatchListState extends State<ShowsWatchList> {
  List<Shows> mShows = [];
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    getShows();
  }

  void getShows() {
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      setState(() {
        mShows = showsList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return mShows.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.yellowColor),
            ),
          )
        : Container(
            margin: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: mShows.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: const Color(0xff373737),
                    ),
                    height: _size.height * 0.11,
                    child: Row(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              bottomLeft: Radius.circular(6.0),
                            ),
                            child: Image.asset(
                              mShows[index].showPosterUrl,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: AppColors.whiteColor,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7.0, vertical: 2.5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(width: 3.0),
                                          Text(
                                            mShows[index].showName,
                                            style: const TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          const Icon(
                                            Icons.chevron_right_rounded,
                                            size: 12,
                                            color: AppColors.whiteColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        mShows[index].showEpisode,
                                        style: const TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Visibility(
                                        visible: mShows[index].showAired,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0, vertical: 1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            color: AppColors.greenColor,
                                          ),
                                          child: const Text(
                                            "AIRED",
                                            style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    mShows[index].showEpisodeName,
                                    style: const TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: !mShows[index].showAired,
                                replacement: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      print("clicked");
                                      setState(() {
                                        mShows[index].showAired = !isChecked;
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: !isChecked
                                              ? AppColors.whiteColor
                                              : AppColors.greenColor,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.check,
                                        color: !isChecked
                                            ? AppColors.greyColor
                                            : AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, top: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        mShows[index].showEpisodeTime,
                                        style: const TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        mShows[index].showNetworks,
                                        style: const TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
