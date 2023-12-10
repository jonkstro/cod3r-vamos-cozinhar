import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/components/category_item.dart';
import 'package:vamos_cozinhar/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Forma de renderizar a grid
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        /// Largura máxima do elemento (Quadradinho)
        /// Em um celular vai ter 2, mas se virar vai ter mais quadrados
        maxCrossAxisExtent: 200,

        /// Proporção largura por altura (1:1, 2:1, etc...)
        childAspectRatio: 3 / 2,

        /// Espaçamento entre os elementos (CROSS = Lateral, MAIN = Vertical)
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),

      /// Aqui vamos percorrer cada categoria mockada e converter em
      /// um widget CategoryItem
      children: DUMMY_CATEGORIES.map(
        (categoria) {
          return CategoryItem(
            category: categoria,
            key: Key(categoria.id),
          );
        },
      ).toList(),
    );
  }
}
