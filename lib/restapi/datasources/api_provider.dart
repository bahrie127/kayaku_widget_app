import 'package:http/http.dart' as http;
import 'package:kayaku_widget_app/restapi/models/news_model.dart';

class ApiProvider {
  final String _baseUrl = 'https://newsapi.org/v2';
  final String _apiKey = '412c98bdbbbe4762a921933c5097bd84';

  Future<NewsModel> fetchTopHeadlines() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/top-headlines??country=us&category=business&apiKey=$_apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return NewsModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<NewsModel> searchArticles(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/everything?q=$query&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      return NewsModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
