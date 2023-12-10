import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  /// Vamos reaproveitar essse widget de seção do titulo
  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: null,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),

      /// Listar os ingredientes com ListView
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(),
                // Imagem hospedada externamente
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),

              /// ESSE CONTAINER VAI SER USADO NO _createSectionTitle()
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 10),
              //   decoration: null,
              //   child: Text(
              //     "Ingredientes",
              //     style: Theme.of(context).textTheme.titleMedium,
              //   ),
              // ),
              _createSectionTitle(context, 'Ingredientes'),

              /// VAI SER USADO PELO _createSectionContainer
              // Container(
              //   width: 300,
              //   height: 200,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(
              //       color: Colors.grey,
              //     ),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   padding: const EdgeInsets.all(10),
              //   margin: const EdgeInsets.all(10),

              //   /// Listar os ingredientes com ListView
              //   child: ListView.builder(
              //     itemCount: meal.ingredients.length,
              //     itemBuilder: (ctx, index) {
              //       return Card(
              //         color: Theme.of(context).colorScheme.secondary,
              //         child: Padding(
              //             padding: const EdgeInsets.symmetric(
              //               vertical: 5,
              //               horizontal: 10,
              //             ),
              //             child: Text(meal.ingredients[index])),
              //       );
              //     },
              //   ),
              // )
              _createSectionContainer(
                /// Listar os ingredientes com ListView
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(meal.ingredients[index])),
                    );
                  },
                ),
              ),
              _createSectionTitle(context, 'Passos'),
              _createSectionContainer(
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        /// Adicionar a lista com avatar
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text('${index + 1}'),
                          ),
                          title: Text(
                            meal.steps[index],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),

                        /// Adicionar linha que separa
                        const Divider(),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}
