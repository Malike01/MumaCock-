import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scaled_list/scaled_list.dart';
import '../../utils/helpers/locator_helper.dart';
import '../../utils/styles/custom_color_styles.dart';
import '../cocktail_recipe_page/cocktail_recipe_viewmodel.dart';
import 'favorites_view_model.dart';

class Favorites extends StatelessWidget {
   Favorites({Key? key,}) : super(key: key);

  CocktailRecipeViewModel? viewModel = getIt<CocktailRecipeViewModel>();

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: ScaledList(
        itemCount: cocktails.length,
        itemColor: (index)
    {
      return getIt<CustomColorStyles>()
          .kMixedColors[index % getIt<CustomColorStyles>().kMixedColors.length];
    },
        itemBuilder: (index, selectedIndex) {
        final cocktail = cocktails[index];
       return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
           height: selectedIndex == index ? 100 : 80,
           child: Image.asset(cocktail.image),
       ),
       const SizedBox(height: 15),
          Text(
           cocktail.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: selectedIndex == index ? 25 : 20),
          )
        ],
       );
      },
    ));
  }
}

