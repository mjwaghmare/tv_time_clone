class Shows {
  String showName;
  String showStatus;
  String showNetworks;
  String showPosterUrl;
  String showEpisode;
  String showEpisodeName;
  String showEpisodeTime;
  bool showAired;

  Shows({
    this.showName,
    this.showStatus,
    this.showNetworks,
    this.showPosterUrl,
    this.showEpisode,
    this.showEpisodeName,
    this.showEpisodeTime,
    this.showAired,
  });
}

class Movies {
  String movieName;
  String movieYear;
  String movieGenre;
  String moviePosterUrl;
  String daysBeforeRelease;

  Movies({
    this.movieName,
    this.movieYear,
    this.movieGenre,
    this.moviePosterUrl,
    this.daysBeforeRelease,
  });
}
