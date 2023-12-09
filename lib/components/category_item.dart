import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/screens/categories_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  /// Esse método vai ser responsável por exibir na tela a tela da categoria clicada
  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      /// Vou retornar um MATERIAL PAGE, mas pode fazer CUPPERTINO page pra IOS usando
      /// Platform.isIOS da biblioteca dart:io
      /// Ex.: Platform.isIOS ? CupertinoPageRoute(...) : MaterialPageRoute(...)
      MaterialPageRoute(
        builder: (_) {
          return const CategoriesMealsScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double raio = 15.0;
    return InkWell(
      /// Quando clicadi irá executar o método _selectCategory
      onTap: () {
        _selectCategory(context);
      },
      // vai adicionar a cor rosa [ou outra cor se quiser] quando segurar no botão
      // splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(raio), // No magic numbers here!
      child: Container(
        /// Estilizando o container, com cores gradientes
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raio), // No magic numbers here!
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.40),
              category.color.withOpacity(0.95),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
