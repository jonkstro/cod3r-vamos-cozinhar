import 'package:flutter/material.dart';
import '../models/category.dart';
import '../utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  /// Esse método vai ser responsável por exibir na tela a tela da categoria clicada
  void _selectCategory(BuildContext context) {
    /// Aqui era usado antes de passar a categoria por argumento no Push, quando era
    /// passada pelo construtor de CategoriesMealScreen
    ///
    // Navigator.of(context).push(
    //   /// Vou retornar um MATERIAL PAGE, mas pode fazer CUPPERTINO page pra IOS usando
    //   /// Platform.isIOS da biblioteca dart:io
    //   /// Ex.: Platform.isIOS ? CupertinoPageRoute(...) : MaterialPageRoute(...)
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoriesMealsScreen(category: category);
    //     },
    //   ),
    // );

    /// Aqui é navegação passando a categoria por argumento no push e usando uma
    /// rota nomeada [por isso pushNamed]
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,

      /// Vamos passar no argumento a categoria, pra não precisar passar no construtor
      arguments: category,
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
