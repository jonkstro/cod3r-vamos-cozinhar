import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/components/meal_item.dart';
import 'package:vamos_cozinhar/data/dummy_data.dart';
import 'package:vamos_cozinhar/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Vai receber a categoria através de argumento na hora que fizer o push
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    /// Aqui estamos pegando de dummy_data as Meals que tem categoria igual a
    /// category.id. Ex.: 'Spaghetti with Tomato Sauce' tem 'c1' e 'c2' em categories
    /// se mudar pelo titulo pega tbm mas tem que mudar no dummy_data.dart
    final categoryMeals = DUMMY_MEALS.where((meal) {
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
