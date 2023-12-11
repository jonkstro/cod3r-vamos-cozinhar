import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  /// Função que vai criar icones e navegar entre as telas
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).textTheme.titleMedium?.color,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.restaurant,
            'Refeições',
            () {
              // Vai substituir ao inves de dar push, logo não vai ter a <- na appbar
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            () {
              // Vai substituir ao inves de dar push, logo não vai ter a <- na appbar
              Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS);
            },
          ),
        ],
      ),
    );
  }
}
