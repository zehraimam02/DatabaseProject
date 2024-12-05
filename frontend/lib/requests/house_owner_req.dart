import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HouseRequests{

  Future<void> fetchHouseOwners() async {
    final url = Uri.parse("http://localhost:4449/api/houseOwners");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // Decode JSON response
        debugPrint('data returned: ${data}'); // Access the houseOwners list
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }
  }

}