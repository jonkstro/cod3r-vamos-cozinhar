import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  /// Passar a categoria pelo construtor:
  final Category category;

  const CategoriesMealsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text(
          'Receitas por categoria ${category.id}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
