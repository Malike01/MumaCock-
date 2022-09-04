import 'package:flutter/material.dart';
import '../../utils/helpers/locator_helper.dart';
import '../../utils/styles/custom_color_styles.dart';


class FavButton extends StatefulWidget {
  const FavButton({Key? key}) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            padding:const EdgeInsets.only(left: 5.0),
            height: 40,
            width: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child:CustomButton(
              backgroundColor: getIt<CustomColorStyles>().bbd0ff,
              size: 20,
              icon:Icons.favorite_border,
              borderColor: getIt<CustomColorStyles>().bbd0ff,
              isIcon: false,
        )
        )],
    );
  }
}


class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final IconData? icon;
  final double size;
  final bool isIcon;
  final void onPressed;
  const CustomButton({Key? key, required this.backgroundColor, required this.borderColor, this.icon, required this.size, required this.isIcon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Center(
        child: isIcon==true
            ? const Icon(Icons.favorite,color: Colors.white,)
            : const Icon(Icons.favorite_border,color: Colors.white),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
           color: Colors.grey.shade500,
            offset: Offset(4,4),
            blurRadius: 15,
            spreadRadius: 1
          ),
          BoxShadow(
              color: getIt<CustomColorStyles>().bbd0ff,
              offset:const Offset(-4,-4),
              blurRadius: 15,
              spreadRadius: 1
          )
        ],
      ),
    );
  }
}


