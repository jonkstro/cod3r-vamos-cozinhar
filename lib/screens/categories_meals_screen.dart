import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
      ),
      body: Center(
        child: Text(
          'Receitas por categoria',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
