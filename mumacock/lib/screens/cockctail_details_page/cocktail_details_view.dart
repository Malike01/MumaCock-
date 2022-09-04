import 'package:flutter/material.dart';
import 'package:mumacock/screens/cockctail_details_page/body.dart';
import '../../utils/constants/double_contants.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/helpers/locator_helper.dart';
import '../../utils/styles/custom_color_styles.dart';
import '../../utils/styles/custom_text_styles.dart';

class CocktailDetailsView extends StatelessWidget {

  const CocktailDetailsView({Key? key, this.index}) : super(key: key);

  final int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:getIt<CustomColorStyles>().c8b6ff,
      appBar: buildAppBar(context),
      body: Body(index: index),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:getIt<CustomColorStyles>().c8b6ff,
      title: Text(getIt<StringConstants>().appName,
          style: getIt<CustomTextStyles>().boldWhiteTextStyle),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: (Radius.circular(getIt<DoubleConstants>().radius)),
          bottomLeft: Radius.circular(getIt<DoubleConstants>().radius),
        ),
      ),
      leading: IconButton(
        icon:const Icon(Icons.arrow_back_ios_sharp,color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}