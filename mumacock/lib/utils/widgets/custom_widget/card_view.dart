import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;

import '../../../screens/cocktail_recipe_page/cocktail_recipe_viewmodel.dart';
import '../../helpers/locator_helper.dart';
import '../../styles/custom_color_styles.dart';


class CardCockTailPosition extends StatelessWidget {
   CardCockTailPosition({
    Key? key,
    required double borderRadius, this.index,
  }) : _borderRadius = borderRadius, super(key: key);

  final double _borderRadius;
   CocktailRecipeViewModel? viewModel = getIt<CocktailRecipeViewModel>();

   final int? index;


  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 70,
        bottom:0,
        right: 0,
        child: CustomPaint(
          size: Size(80,100),
          painter: viewModel?.cocktailRecipeData?[index!].strCategory!="Cocktail" ? CardShapePaint(HexColor("#ffd6ff"),HexColor("#e7c6ff"),_borderRadius):CardShapePaint(getIt<CustomColorStyles>().bbd0ff,getIt<CustomColorStyles>().bbd0ff,_borderRadius),
        )
    );
  }
}

class CardShapePaint extends CustomPainter{
  final Color startColor;
  final Color endColor;
  final double radius;

  CardShapePaint(this.startColor, this.endColor, this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    var radius=24.0;

    var paint=Paint();
    paint.shader= ui.Gradient.linear(Offset(0,0), Offset(size.width,size.height),
        [HSLColor.fromColor(startColor).withLightness(0.8).toColor(),endColor]);

    var path= Path()
      ..moveTo(0,size.height)
      ..lineTo(size.width-radius,size.height)
      ..quadraticBezierTo(size.width,size.height,size.width,size.height-radius)
      ..lineTo(size.width,radius)
      ..quadraticBezierTo(size.width,0,size.width-radius,0)
      ..lineTo(size.width-1.5 * radius,0)
      ..quadraticBezierTo(-radius,2 * radius,0,size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class CardCockTailContainer extends StatelessWidget {

  const CardCockTailContainer({
    Key? key,
    required double borderRadius,
    required List<Color> colors,
    required String title,
    required this.imageURL,
     required this.category,
  }) : _borderRadius = borderRadius,_colors=colors, _title=title, super(key: key);

  final double _borderRadius;
  final  List<Color> _colors;
  final  String _title;
  final String imageURL;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.network(
                  imageURL,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                )),
            title: Text(
              _title,
              style: TextStyle(color:Colors.deepPurple[300], fontSize: 20),
            ),
            subtitle: Text("Category: $category", style: TextStyle(color:Colors.white),
          ),
          )],
      ),
      height: 150,
      decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(_borderRadius),
          gradient:LinearGradient(
            colors:_colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow:[
            BoxShadow(
              color: HexColor("#e7c6ff"),
              blurRadius: 12,
              offset: Offset(0,6),
            )]),
    );
  }
}