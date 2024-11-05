part of 'helpers.dart';

const String kAppName = "HassonTv";

//TODO: SHow Ads ( true / false )
const bool showAds = false;

const String kIconLive = "assets/images/live-stream.png";
const String kIconSeries = "assets/images/clapperboard.png";
const String kIconMovies = "assets/images/film-reel.png";
const String kIconSplash = "assets/images/icon.png";
const String kImageIntro = "assets/images/intro h.jpeg";

const String kPrivacy = "https://hassontv-eg.com/%D8%B3%D9%8A%D8%A7%D8%B3%D8%A9-%D8%A7%D9%84%D8%AE%D8%B5%D9%88%D8%B5%D9%8A%D8%A9/";
const String kContact = "https://www.fiverr.com/osmben";

const double sizeTablet = 950;

enum TypeCategory {
  all,
  live,
  movies,
  series,
}

Size getSize(BuildContext context) => MediaQuery.of(context).size;

bool isTv(BuildContext context) {
  return MediaQuery.of(context).size.width > sizeTablet;
}
