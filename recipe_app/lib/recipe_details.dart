import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';

class RecipeDetailsPage extends StatefulWidget {
  final Recipe recipe; // Accept the selected Recipe as a parameter

  RecipeDetailsPage({required this.recipe});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.recipe.title), // Display the recipe title in the app bar
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Image.network(
                      widget.recipe.imageUrl), // Display the recipe's image
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.recipe.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Text(
                    widget.recipe.description,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.ingredients.map((ingredient) {
                      return Text(
                        '- $ingredient',
                        style: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),

                  Slider(
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: '${_sliderVal.toInt()} servings',
                    value: _sliderVal.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        _sliderVal = newValue.round();
                      });
                    },
                    activeColor: Colors.green,
                    inactiveColor: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
