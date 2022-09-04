import 'package:flutter/material.dart';
import 'package:mumacock/screens/cockctail_details_page/CocktailTitleWithImage.dart';
import 'package:mumacock/screens/cockctail_details_page/Description.dart';
import 'package:mumacock/screens/cockctail_details_page/FavButton.dart';
import '../../utils/constants/double_contants.dart';
import '../../utils/helpers/locator_helper.dart';

class Body extends StatelessWidget {

  const Body({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 500,
                  padding: EdgeInsets.only(
                    top: 20,
                    left:getIt<DoubleConstants>().kDefaultPadding,
                    right:getIt<DoubleConstants>().kDefaultPadding,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child:SingleChildScrollView(
                    child:Column(
                    children: <Widget>[
                      FavButton(),
                     Description(index:index),
                    ],
                  ),
                )),
                ProductTitleWithImage(index:index),
              ],
            ),
          )
        ],
      ),
    );
  }
}

