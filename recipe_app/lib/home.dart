import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/recipe_details.dart';
// Import the Recipe model

class HomePage extends StatelessWidget {
  final recipes = Recipe.recipe();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RecipeDetailsPage(
                        recipe: recipes[index],
                      )));
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(recipes[index].imageUrl),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recipes[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
