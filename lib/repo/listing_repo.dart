import 'dart:convert';

import 'package:http/http.dart';
import 'package:movieapp/model/listing.dart';

class ListingRepo {
  String listingUrl =
      "https://mocki.io/v1/cead1ab5-8153-4557-a587-f6ebb2710769";

  Future<ListingResponse> fetchListingData() async {
    Response response = await get(Uri.parse(listingUrl));
    if (response.statusCode == 200) {
      print("response $response");
      print("API Response: ${response.body}");
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return ListingResponse.fromJson(jsonResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
