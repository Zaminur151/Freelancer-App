import 'dart:convert';
import 'package:freelancer_app/models/freelancer_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://xilancer.xgenious.com/api/v1/';

  Future<List<Freelancer>> fetchFreelancers() async {
    final url = Uri.parse('${baseUrl}freelancers/list?per_page=15');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final data = body['data'] ?? [];

      return List<Freelancer>.from(
        data.map((item) => Freelancer.fromJson(item)),
      );
    } else {
      throw Exception('Failed to load freelancers');
    }
  }
}
