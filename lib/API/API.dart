import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:http/http.dart' as http;

import 'Episode.dart';
import 'Anime.dart';

class API {
  static String endpoint = 'https://api.twist.moe/api';
  static String accessToken = '0df14814b9e590a1f26d3071a4ed7974';
  static String encryptionKey = '267041df55ca2b36f2e322d05ee2c9cf';
  static String cdnEndpoint = 'https://cdn.twist.moe';

  static Future<List<Anime>?> getAllAnime() async {
    var response = await http.get(
      Uri.parse('$endpoint/anime'),
      headers: {
        'x-access-token': accessToken,
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    return List<Anime>.from(data.map((entry) => Anime.fromJson(entry)));
  }

  static Future<Anime?> getAnime(Anime anime) async {
    var response = await http.get(
      Uri.parse('$endpoint/anime/${anime.slug.slug}'),
      headers: {
        'x-access-token': accessToken,
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    return Anime.fromJson(data);
  }

  static Future<List<Episode>?> getSources(Anime anime) async {
    var response = await http.get(
      Uri.parse('$endpoint/anime/${anime.slug.slug}/sources'),
      headers: {
        'x-access-token': accessToken,
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    var sources = List<Episode>.from(data.map((entry) => Episode.fromJson(entry)));
    sources.forEach((element) => element.source = _decryptRoute(element.source!));
    return sources;
  }

  static List<int> _bytesToKey(List<int> data, List<int> salt, int output) {
    data += salt;
    var key = md5.convert(data).bytes;
    var finalKey = List.from(key);

    while (finalKey.length < output) {
      key = md5.convert(key + data).bytes;
      finalKey += key;
    }

    return List<int>.from(finalKey.getRange(0, output));
  }

  static String _decryptRoute(String route) {
    var bytes = base64Decode(route);
    var salt = bytes.getRange(8, 16).toList();

    var passphrase = utf8.encode(encryptionKey); // Key located in webpack:///./src/components/VideoPlayer/VideoPlayer.js

    var keyIv = _bytesToKey(passphrase, salt, 32 + 16);
    var key = keyIv.getRange(0, 32).toList();
    var iv = keyIv.skip(32).toList();

    var aes = encrypt.Encrypter(
      encrypt.AES(
        encrypt.Key(Uint8List.fromList(key)),
        mode: encrypt.AESMode.cbc,
      ),
    );

    return aes.decrypt(
      encrypt.Encrypted(
        Uint8List.fromList(bytes.skip(16).toList()),
      ),
      iv: encrypt.IV(Uint8List.fromList(iv)),
    );
  }
}
