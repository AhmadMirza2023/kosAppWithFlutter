import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kosan/models/space_model.dart';

class SpaceProvider extends ChangeNotifier {
  Future<List<SpaceModel>> getRecommendedSpaces() async {
    var result = await http
        .get(Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces'));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List<dynamic> data = jsonDecode(result.body);
      List<SpaceModel> spaces =
          data.map((item) => SpaceModel.fromJson(item)).toList();
      return spaces;
    } else {
      return <SpaceModel>[];
    }
  }
}
