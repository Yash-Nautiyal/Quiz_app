import 'dart:convert';
import 'package:brainstock/views/home/data/model/quiz_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "https://api.jsonserve.com/Uw5CrX"; // Replace with actual API URL

  Future<QuizModel> fetchQuizzes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      print(jsonData); // Fix here
      return QuizModel.fromJson(jsonData);
    } else {
      throw Exception("Failed to load quizzes");
    }
  }
}
