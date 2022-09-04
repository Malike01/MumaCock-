import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mumacock/utils/helpers/locator_helper.dart';
import '../cocktail_recipe_page/cocktail_recipe_viewmodel.dart';

class Description extends StatelessWidget {
   Description({
    Key? key, this.index,
  }) : super(key: key);

   CocktailRecipeViewModel? viewModel = getIt<CocktailRecipeViewModel>();

   final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Wrap(
            children: [
              Text(
                "Description:\n${viewModel?.cocktailRecipeData?[index!].strInstructions}",
                style: const TextStyle(height: 1.5),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Text(
                "Ingredients:\n${viewModel?.cocktailRecipeData?[index!].strIngredient1}\n"
                    "${viewModel?.cocktailRecipeData?[index!].strIngredient2}\n"
                    "${viewModel?.cocktailRecipeData?[index!].strIngredient3}\n"
                    "${viewModel?.cocktailRecipeData?[index!].strIngredient4}\n",
                style: TextStyle(height: 1.5),
              )],
          )],
      ));
  }
}

