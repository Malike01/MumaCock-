import 'package:flutter/material.dart';
import '../../utils/helpers/locator_helper.dart';
import 'package:mumacock/utils/constants/double_contants.dart';
import '../../utils/styles/custom_color_styles.dart';
import '../cocktail_recipe_page/cocktail_recipe_viewmodel.dart';


class ProductTitleWithImage extends StatelessWidget {

  ProductTitleWithImage({
    Key? key, this.index,

  }) : super(key: key);

  CocktailRecipeViewModel? viewModel = getIt<CocktailRecipeViewModel>();

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getIt<DoubleConstants>().kDefaultPadding),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${viewModel?.cocktailRecipeData?[index!].strDrink}",
              style: TextStyle(
                fontSize: 30,
                  color: getIt<CustomColorStyles>().white
              ),
            ),
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${viewModel?.cocktailRecipeData?[index!].strAlcoholic}",
                        style: TextStyle(color: getIt<CustomColorStyles>().white)
                      ),
                      TextSpan(
                          text: "\n${viewModel?.cocktailRecipeData?[index!].strCategory}",
                          style: TextStyle(color: getIt<CustomColorStyles>().white)
                      ),
                      TextSpan(
                          text: "\n${viewModel?.cocktailRecipeData?[index!].strGlass}",
                          style: TextStyle(color: getIt<CustomColorStyles>().white)
                      ),
                    ],
                  ),
                ),
                SizedBox(width:getIt<DoubleConstants>().kDefaultPadding),
                Expanded(
                  child:ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                  child:Image.network(
                  "${viewModel?.cocktailRecipeData?[index!].strDrinkThumb}",
                    height: 200,
                    fit:BoxFit.fitHeight,
                  )
                  ),
                )],
            )
          ],
        ),
      ),
    );
  }
}
