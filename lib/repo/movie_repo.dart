import 'dart:convert';

import 'package:http/http.dart';
import 'package:movieapp/model/movie.dart';

class MovieRepo {
  String userUrl = 'https://mocki.io/v1/783f8c69-af91-45ff-87df-e675c3f11fef';

  Future<MovieModel> fetchData() async {
    Response response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      print("response $response");
      print("API Response: ${response.body}");

      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return MovieModel.fromJson(jsonResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
