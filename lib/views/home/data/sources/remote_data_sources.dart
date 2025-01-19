import 'dart:convert';
import 'package:brainstock/views/home/data/model/quiz_model.dart';
import 'package:http/http.dart' as http;

abstract class QuizRemoteDataSource {
  Future<QuizModel> fetchQuiz();
}

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final http.Client client;
  final String apiUrl = "https://api.jsonserve.com/Uw5CrX"; // Your API URL

  QuizRemoteDataSourceImpl({required this.client});

  @override
  Future<QuizModel> fetchQuiz() async {
    final response = await client.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return QuizModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load quiz data");
    }
  }
}
