import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/screens/categories_meals_screen.dart';
import 'package:vamos_cozinhar/screens/categories_screen.dart';
import 'package:vamos_cozinhar/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Variavel que vai definir o tema de cor
    final ThemeData tema = ThemeData();
    return MaterialApp(
      /// Definindo as cores primarias e secundarias.
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 20 * MediaQuery.of(context).textScaleFactor,
            fontFamily: 'RobotoCondensed',
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 16 * MediaQuery.of(context).textScaleFactor,
            fontFamily: 'Raleway',
          ),
        ),
      ),
      home: const CategoriesScreen(),

      /// Aqui estaremos centralizando as rotas do projeto, para fins de organização
      /// parecido com o que temos em WEB ('/' quer dizer o Home).
      initialRoute: AppRoutes.HOME,
      routes: {
        // Não precisa adicionar o HOME aqui, senão dá erro de redundancia
        AppRoutes.CATEGORIES_MEALS: (context) => const CategoriesMealsScreen(),
      },
    );
  }
}
