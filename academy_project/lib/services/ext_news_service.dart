import 'dart:convert' as convert;
// import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:academy_project/models/articles/ext_news_response.dart';

const _apiKey = '613ec69182b740748e5402ba1a12a45f';
const _apiBaseUrl = 'http://newsapi.org/v2';
const _everythingEndpoint = '$_apiBaseUrl/everything';

abstract class ExtNewsService {
  Future<List<Article>> getNews();
}

var currentDate = new DateTime.now();

class ExtNewsServiceImpl implements ExtNewsService {
  @override
  Future<List<Article>> getNews(
      {String tag = 'bitcoin',
      String from = '2020-12-22',
      String to = '',
      String sortBy = 'publishedAt'}) async {
    final quety = mapToQuery({
      'q': tag,
      'from': from,
      'to': to,
      'sortBy': sortBy,
      'apiKey': _apiKey,
    });
    if (to == null){
      to = new DateFormat.yMd().format(currentDate);
    }

    final url = '$_everythingEndpoint$quety';
    final response = await http.get(url);
    final rawMap = convert.jsonDecode(response.body);
    final parsedResponse = ExtNewsResponse.fromJson(rawMap);
    return parsedResponse.articles;
  }
}

String mapToQuery(Map<String, String> map) {
  var first = true;
  StringBuffer bufer = StringBuffer();
  for (var key in map.keys) {
    final value = map[key];
    if (first) {
      first = false;
      bufer.write('?');
    } else {
      bufer.write('&');
    }
    bufer.write('$key=$value');
  }
  return bufer.toString();
}
