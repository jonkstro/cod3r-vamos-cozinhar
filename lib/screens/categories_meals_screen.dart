import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/components/meal_item.dart';
import 'package:vamos_cozinhar/models/category.dart';

import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  /// As meals vão ser passadas pelo construtor, o filtro vai ser feito no main
  final List<Meal> meals;
  const CategoriesMealsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    /// Recebe a categoria através de argumento na quando fizer push no CategoryItem
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    /// Aqui estamos pegando de dummy_data as Meals que tem categoria igual a
    /// category.id. Ex.: 'Spaghetti with Tomato Sauce' tem 'c1' e 'c2' em categories
    /// se mudar pelo titulo pega tbm mas tem que mudar no dummy_data.dart
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: categoryMeals.isNotEmpty
          ? ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (ctx, index) {
                return MealItem(meal: categoryMeals[index]);
              },
            )
          : Center(
              child: Text(
                'Nenhuma refeição cadastrada para essa categoria',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
    );
  }
}
