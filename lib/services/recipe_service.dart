import 'package:dio/dio.dart';
import 'package:recipe_app/api.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeService {
  Future<List<Recipe>> getRecipe({required String query}) async {
    final dio = Dio();
    try {
      final response = await dio.get(Api.baseUrl,
          queryParameters: {
            'q': query,
          },
          options: Options(
            headers: {
              'X-RapidAPI-Host': 'cooking-recipe2.p.rapidapi.com',
              'X-RapidAPI-Key':
                  '41ce2ec821msh0211c1b23b4c67cp1cd7dbjsna3dfb6830362',
            },
          ));
      final data =
          (response.data as List).map((e) => Recipe.fromJson(e)).toList();
      return data;
    } on DioError catch (e) {
      // return [];
      throw Exception(e.message);
    }
  }
}
