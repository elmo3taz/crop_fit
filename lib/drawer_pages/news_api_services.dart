import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? 'https://via.placeholder.com/150',
      url: json['url'] ?? '',
    );
  }
}

class NewsService {
  final String apiKey = '29f5d8bb8f16481ca7ea17f3e96ba4f8'; // ← حط مفتاحك هنا

  Future<List<NewsArticle>> fetchEgyptAgricultureNews() async {
   final url = Uri.parse(
      'https://newsapi.org/v2/everything?q=plants&sortBy=publishedAt&apiKey=$apiKey',
    );



    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final articles = data['articles'] as List;

      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
