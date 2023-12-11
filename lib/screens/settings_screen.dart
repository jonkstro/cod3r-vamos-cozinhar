import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  /// Vai receber o estado do filtro la do main
  final Settings settings;

  /// Função que vai fazer os filtros, recebendo um objeto Settings
  final Function(Settings) onSettingsChanged;
  const SettingsScreen({
    super.key,
    required this.onSettingsChanged,
    required this.settings,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /// Objeto settings que vai servir de filtro
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  /// Método que vai criar os switchs do filtro, pra serem reutilizados
  /// pra tirar o nomeado só tirar {} e required
  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged, //vaidarmerda vai
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);

        /// Vamos chamar a função criada lá no state lá em cima
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
          centerTitle: true,
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              /// Mostrando os Switchs
              child: ListView(
                children: <Widget>[
                  _createSwitch(
                    title: 'Sem Glútem',
                    subtitle: 'Só exibe refeições sem glútem',
                    value: settings.isGlutenFree,
                    onChanged: (value) {
                      setState(
                        () {
                          settings.isGlutenFree = value;
                        },
                      );
                    },
                  ),
                  _createSwitch(
                    title: 'Sem Lactose',
                    subtitle: 'Só exibe refeições sem lactose',
                    value: settings.isLactoseFree,
                    onChanged: (value) {
                      setState(
                        () {
                          settings.isLactoseFree = value;
                        },
                      );
                    },
                  ),
                  _createSwitch(
                    title: 'Vegana',
                    subtitle: 'Só exibe refeições veganas',
                    value: settings.isVegan,
                    onChanged: (value) {
                      setState(
                        () {
                          settings.isVegan = value;
                        },
                      );
                    },
                  ),
                  _createSwitch(
                    title: 'Vegetarianas',
                    subtitle: 'Só exibe refeições vetetarianas',
                    value: settings.isVegetarian,
                    onChanged: (value) {
                      setState(
                        () {
                          settings.isVegetarian = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
