import 'dart:io';

import 'package:dart_twistmoe/Twist.dart' as twist;
import 'package:http/http.dart' as http;

Future<void> download(twist.Episode episode) async {
  var client = http.Client();

  var request = http.Request(
    'GET',
    Uri.parse('https://cdn.twist.moe${episode.source}'),
  )..headers['referer'] = 'https://twist.moe/';

  var response = await client.send(request);

  var file = File(episode.source!.split('/').last);

  var stream = response.stream;
  stream.handleError(
    (e) async {
      await Future.delayed(Duration(seconds: 5));
      await download(episode);
    },
  );
  stream.timeout(
    Duration(seconds: 10),
    onTimeout: (e) async {
      await Future.delayed(Duration(seconds: 5));
      await download(episode);
    },
  );

  var received = 0.0;
  await for (var value in stream) {
    await file.writeAsBytes(
      value,
      mode: (received <= 0.0) ? FileMode.write : FileMode.append,
      flush: true,
    );
    received += value.length.toDouble();
    print('${file.path}: ${received / response.contentLength!.toDouble() * 100.0}');
  }
}

void main() async {
  var allAnime = await twist.API.getAllAnime();
  // for (var anime in allAnime!) {
  //   print(anime.title);
  // }

  var animesFound = allAnime!.where((element) => element.title.toLowerCase().contains('yuru yuri'));

  for (var animeFound in animesFound) {
    var anime = await twist.API.getAnime(animeFound);
    print(anime!.toJson());

    var sources = await twist.API.getSources(animeFound);
    print(sources!.first.toJson());

    for (var episode in sources) {
      await download(episode);
    }
  }
}
