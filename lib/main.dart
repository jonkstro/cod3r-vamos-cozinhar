import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/data/dummy_data.dart';
import 'package:vamos_cozinhar/models/meal.dart';
import 'package:vamos_cozinhar/models/settings.dart';
import 'package:vamos_cozinhar/screens/categories_meals_screen.dart';
import 'package:vamos_cozinhar/screens/meal_detail_screen.dart';
import 'package:vamos_cozinhar/screens/settings_screen.dart';
import 'package:vamos_cozinhar/screens/tabs_screen.dart';
import 'package:vamos_cozinhar/screens/unknown_screen.dart';
import 'package:vamos_cozinhar/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Variável que vai armazenar o estado do filtro, pra recuperar o estado quando
  /// entrar e sair novamente da tela SettingsScreen
  Settings settings = Settings(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  );

  /// Não é final, pois vai ser alterado pelos filtros constantemente
  List<Meal> _availableMeals = DUMMY_MEALS;

  /// Lista de comidas favoritas do user, ela tem que ser passada até tela de favoritos
  /// vai ter que passar pra tab_screen até favorite_screen
  final List<Meal> _favoriteMeals = [];

  /// Se a comida tiver marcada remove dos favoritos, senão adiciona
  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  /// Vai dizer se a comida é favorita ou não pra pintar o botão
  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  /// Método que vai filtrar as meals (where)
  void _filterMeals(Settings settings) {
    setState(() {
      /// Setando o valor da settings pro valor do filtro, esse loop vai permitir
      /// gravar o estado do filtro na SettingsScreen e não ficar resetando pra off
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        /// Os filtros abaixo quer dizer que vai ter que tirar da lista das comidas
        /// se algum dos filtros abaixo for verdadeiro, quer dizer que a comida
        /// não deverá ser exibida pois não atenderá aos requisitos.
        final isGlutenFree = settings.isGlutenFree && !meal.isGlutenFree;
        final isLactoseFree = settings.isLactoseFree && !meal.isLactoseFree;
        final isVegan = settings.isVegan && !meal.isVegan;
        final isVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !isGlutenFree && !isLactoseFree && !isVegan && !isVegetarian;
      }).toList();
    });
  }

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

      /// A home é a pagina que vai ter as tabs e carregar as outras páginas
      /// vamos enviar pra TabScreen as favoritas pra ela mandar pra FavoriteScreen
      home: TabScreen(favoriteMeals: _favoriteMeals),

      /// Aqui estaremos centralizando as rotas do projeto, para fins de organização
      /// parecido com o que temos em WEB ('/' quer dizer o Home).
      // initialRoute: AppRoutes.TAB_SCEEN,
      routes: {
        // Não precisa adicionar o HOME aqui, senão dá erro de redundancia
        // AppRoutes.TAB_SCEEN: (context) => const TabScreen(),
        AppRoutes.CATEGORIES_MEALS:
            (context) => // Passando as meals disponíveis
                CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => // Passando a função de "FAVORITAR"
            MealDetailScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),

        /// Vamos enviar as settings para salvar o estado do filtro
        AppRoutes.SETTINGS: (context) =>
            SettingsScreen(settings: settings, onSettingsChanged: _filterMeals),
      },

      /// Se não achar nenhuma rota vai abrir a "Página 404" igual na WEB
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const UnknownScreen();
          },
        );
      },
    );
  }
}
