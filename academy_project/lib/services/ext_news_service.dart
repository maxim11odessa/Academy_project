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

class ExtNewsServiceImpl implements ExtNewsService {
  @override
  Future<List<Article>> getNews(
      {String tag = 'bitcoin',
      String from,
      String to,
      String sortBy = 'publishedAt'}) async {
    final toDate = to ?? _calculateToDate();
    final fromDate = _calculateFromDate();

    final quety = mapToQuery({
      'q': tag,
      'from': fromDate,
      'to': toDate,
      'sortBy': sortBy,
      'apiKey': _apiKey,
    });

    final url = '$_everythingEndpoint$quety';
    final response = await http.get(url);
    final rawMap = convert.jsonDecode(response.body);
    final parsedResponse = ExtNewsResponse.fromJson(rawMap);
    return parsedResponse.articles;
  }

  String _calculateToDate() {
    final currentDate = DateTime.now();
    final to = DateFormat.yMd().format(currentDate);
    return to;
  }

  String _calculateFromDate() {
    final now = DateTime.now();
    final date = now.subtract(Duration(days: 3));
    final strDate = DateFormat.yMd().format(date);
    return strDate;

    // var sixtyDaysFromNow = now.add(new Duration(days: 60));
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
