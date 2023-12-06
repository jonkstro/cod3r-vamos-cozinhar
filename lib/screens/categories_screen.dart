import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Forma de renderizar a grid
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,

        /// Proporção largura por altura (1:1, 2:1, etc...)
        childAspectRatio: 3 / 2,

        /// Espaçamento entre os elementos (CROSS = Lateral, MAIN = Vertical)
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: const <Widget>[],
    );
  }
}
