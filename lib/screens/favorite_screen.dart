import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/components/meal_item.dart';
import 'package:vamos_cozinhar/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          "Nenhuma refeição favorita cadastrada",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: ((context, index) {
          return MealItem(meal: favoriteMeals[index]);
        }),
      );
    }
  }
}
