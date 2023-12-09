import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Vai receber a categoria através de argumento na hora que fizer o push
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
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
