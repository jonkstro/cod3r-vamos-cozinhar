import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/screens/categories_screen.dart';
import 'package:vamos_cozinhar/screens/favorite_screen.dart';
// import 'package:vamos_cozinhar/screens/categories_screen.dart';
// import 'package:vamos_cozinhar/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  /// Vamos incrementar essa variável pra alterar os estados
  int _selectedScreenIndex = 0;

  /// Ao clicar no navigationbar ele vai alterar entre os indices dessa lista
  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
    {'title': 'Meus Favoritos', 'screen': const FavoriteScreen()},
    // const CategoriesScreen(),
    // const FavoriteScreen(),
  ];

  /// Método que vai alterar a tela mudando o valor da variavel _selectedScreenIndex
  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // DefaultTabController(
        // length: 2,
        Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
        centerTitle: true,

        /// SE QUISER DEIXAR AS TABS EM CIMA NA APPBAR
        /// Aqui no curso vamos usar as tabs em baixo da tela mesmo
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: 'Categorias',
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: 'Favoritos',
        //     ),
        //   ],
        // ),
      ),
      // body: const TabBarView(
      //   children: <Widget>[
      //     CategoriesScreen(),
      //     FavoriteScreen(),
      //   ],
      // ),
      /// Vai ter que castear pra não dar erros
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _selectScreen(value);
        },
        // backgroundColor: Theme.of(context).colorScheme.primary,
        // unselectedItemColor: Colors.white,
        // selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,

        /// Outra alternativa interessante é o shifting, mas tem que botar a cor
        /// dos icones dentro do BottomNavigationBarItem
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
