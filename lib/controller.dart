import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:food_project_app/models/allmeals_model.dart';
import 'package:http/http.dart' as http;

import 'models/ameals_model.dart';

class Controller extends ChangeNotifier {
  bool isLoading = false;
  List<AmealModel> favouriteMeal = [];
  addFavourite(AmealModel value) {
    favouriteMeal.add(value);
    notifyListeners();
  }

  removeFavourite(AmealModel value) {
    favouriteMeal.remove(value);
    notifyListeners();
  }

  Future<AllMealRecipeModel?> getAllMealRecipe() async {
    isLoading = true;
    print("$isLoading");
    notifyListeners();
    const url = 'https://api.freeapi.app/api/v1/public/meals';
    final http.Response response = await http.get(Uri.parse(url));
    AllMealRecipeModel? res;
    // log("This is the response ${response.body}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      res = AllMealRecipeModel.fromJson(data);
    } else {
      return null;
    }
    isLoading = false;
    notifyListeners();
    // print("AllMealRecipeModel ${res.data?.data?.length}");
    return res;
  }

  Future<AMealRecipeModel?> getAMealRecipe(int id) async {
    try {
      print(id);
      final url = 'https://api.freeapi.app/api/v1/public/meals/$id';
      final http.Response response = await http.get(Uri.parse(url));

      log("This is the response ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AMealRecipeModel.fromJson(data);
      } else {
        // log("Failed to load meal detail: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
