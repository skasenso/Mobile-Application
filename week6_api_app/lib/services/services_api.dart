import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class ApiService {
  // Base URL for the API
  final String baseUrl = 'newsapi.org';
  final String apiKey ='5983cdf78ccd4f45a4e0218a3712077f'; // You'll get this from registration

  // Method to fetch news articles
  Future<List<Article>> fetchNewsArticles() async {
    // 1. Build the URL properly (DO NOT use string concatenation)
    final uri = Uri.https(baseUrl, '/v2/top-headlines', {
      'country': 'us',
      'apiKey': apiKey,
    });

    try {
      // 2. Make the network request
      final response = await http.get(uri);

      // 3. Type 1: HTTP error (non-200 status)
      if (response.statusCode != 200) {
        throw HttpException('Server returned ${response.statusCode}');
      }

      // 4. Type 2: JSON parsing error
      try {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        // 5. Extract articles array
        final List<dynamic> articlesJson = jsonData['articles'];

        // 6. Convert each JSON object to Article model
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } catch (e) {
        throw FormatException('Invalid JSON format: $e');
      }
    } on HttpException {
      rethrow; // HTTP errors bubble up unchanged
    } on FormatException {
      rethrow; // JSON parse errors bubble up unchanged
    } catch (e) {
      // Type 3: Network error (no internet, timeout, etc.)
      throw Exception('Failed to connect: $e');
    }
  }
}
