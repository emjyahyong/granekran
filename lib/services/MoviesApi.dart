import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Movie.dart';

class MoviesApi {
  final String baseUrl;

  MoviesApi({required this.baseUrl});

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movies'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}