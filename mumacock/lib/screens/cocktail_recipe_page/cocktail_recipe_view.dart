import 'package:flutter/material.dart';
import 'package:mumacock/screens/cocktail_recipe_page/cocktail_recipe_viewmodel.dart';
import 'package:mumacock/utils/constants/double_contants.dart';
import 'package:mumacock/utils/constants/string_constants.dart';
import 'package:mumacock/utils/styles/custom_color_styles.dart';
import 'package:mumacock/utils/widgets/skeletons/view_model_skeleton.dart';
import '../../utils/constants/route_constants.dart';
import '../../utils/helpers/locator_helper.dart';
import '../../utils/widgets/custom_widget/card_view.dart';

class CocktailRecipeView extends StatefulWidget {
  const CocktailRecipeView({Key? key}) : super(key: key);

  @override
  State<CocktailRecipeView> createState() => _CocktailRecipeViewState();
}

class _CocktailRecipeViewState extends State<CocktailRecipeView> {
  final CocktailRecipeViewModel _viewModel = getIt<CocktailRecipeViewModel>();
  @override
  Widget build(BuildContext context) {
    return ViewModelSkeleton<CocktailRecipeViewModel>(
      builder: (viewModel) => _buildPage(),
      viewModel: _viewModel,
    );
  }

  _buildPage() {
    const double _borderRadius = 24.0;
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(getIt<DoubleConstants>().border_radius),
                child: ListView.builder(
                    itemCount: _viewModel.cocktailRecipeData?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Stack(children: <Widget>[
                              CardCockTailContainer(
                                  category: _viewModel
                                      .cocktailRecipeData?[index].strCategory ??
                                      "Other",
                                  imageURL: _viewModel.cocktailRecipeData?[index]
                                      .strDrinkThumb ??
                                      getIt<StringConstants>().defaultURL,
                                  title: _viewModel
                                      .cocktailRecipeData?[index].strDrink ??
                                      "Error",
                                  borderRadius: _borderRadius,
                                  colors: _viewModel.cocktailRecipeData?[index].strCategory!="Cocktail"
                                      && _viewModel.cocktailRecipeData?[index].strIngredient2!="Gin"
                                      ? [
                                    Colors.white,
                                    getIt<CustomColorStyles>().e7c6ff,
                                    getIt<CustomColorStyles>().ffd6ff
                                  ]:
                                  [
                                    Colors.white,
                                    getIt<CustomColorStyles>().b8c0ff,
                                    getIt<CustomColorStyles>().b8c0ff
                                  ]
                              ),
                              CardCockTailPosition(
                                index: index,
                                  borderRadius: _borderRadius),
                              Positioned(
                                  bottom: 10,
                                  left: 20,
                                  child: Row(
                                    children: <Widget>[
                                      ElevatedButton(
                                          onPressed: () {
                                            _cocktailDetailsGet(context, index);
                                          },
                                          child:const Text("İncele"),
                                          style: ButtonStyle(
                                              backgroundColor:_viewModel.cocktailRecipeData?[index].strCategory!="Cocktail"
                                              && _viewModel.cocktailRecipeData?[index].strIngredient2!="Gin" ?
                                              MaterialStateProperty.all<Color>(
                                                  getIt<CustomColorStyles>().bbd0ff)
                                                  : MaterialStateProperty.all<Color>(
                                                  getIt<CustomColorStyles>().e7c6ff),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(getIt<DoubleConstants>().border_radius),
                                                  side: BorderSide(
                                                      color: getIt<CustomColorStyles>().bbd0ff),
                                                ),
                                              )))],
                                  ))]
                            )));
                    })),
            )],
        ),
       );
  }
}

_cocktailDetailsGet(BuildContext context, int index) {
  Navigator.of(context)
      .pushNamed(RouteConstants.cocktailDetails, arguments: index);
}