import 'package:dart_twistmoe/Twist.dart' as twist;

void main() async {
  var allAnime = await twist.API.getAllAnime();
  for (var anime in allAnime!) {
    print(anime.title);
  }

  var animeFound = allAnime.first;

  var anime = await twist.API.getAnime(animeFound);
  print(anime!.toJson());

  var sources = await twist.API.getSources(animeFound);
  print(sources!.first.toJson());
}
