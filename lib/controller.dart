import 'dart:convert';
import 'dart:developer';

import 'package:food_project_app/models/allmeals_model.dart';
import 'package:http/http.dart' as http;

class Controller {
  Future<void> getAllMealRecipe() async {
    const url = 'https://api.freeapi.app/api/v1/public/meals';
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log(response.body.toString());
      AllMealRecipeModel.fromJson(jsonDecode(response.body),
      );
    } else {
      print('error');
      null;
    }
  }
}
