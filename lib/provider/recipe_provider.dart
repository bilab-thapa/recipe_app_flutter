import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/services/recipe_service.dart';

final recipeProvider =
    FutureProvider((ref) => RecipeService().getRecipe(query: 'meat'));
