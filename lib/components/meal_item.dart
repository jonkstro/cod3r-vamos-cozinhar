import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/models/meal.dart';
import 'package:vamos_cozinhar/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({super.key, required this.meal});

  /// Esse método vai ser responsável por mostrar os detalhes do prato ao ser clicado
  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAIL,

      /// Vamos passar no argumento a refeição, pra não precisar passar no construtor
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectMeal(context);
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              // Stack serve pra botar um texto em cima da imagem
              Stack(
                children: <Widget>[
                  /// ClipRRect é pra deixar as bordas arredondadas já que tá num
                  /// card com bordas arredondadas
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('${meal.duration} mins'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(meal.complexityText),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(meal.costText),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
