import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mumacock/screens/cocktail_recipe_page/bottomNavBar.dart';
import 'package:mumacock/screens/cocktail_recipe_page/card_view.dart';


class CocktailRecipeView extends StatefulWidget {
  const CocktailRecipeView({Key? key}) : super(key: key);

  @override
  State<CocktailRecipeView> createState() => _CocktailRecipeViewState();
}

class _CocktailRecipeViewState extends State<CocktailRecipeView> {
  final double _borderRadius = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Stack(
                                  children: <Widget>[
                                    CardCockTailContainer(
                                      title: "Kokteyl",
                                        borderRadius: _borderRadius,
                                        colors: [
                                          HexColor("#ffd6ff"),
                                          HexColor("#e7c6ff")
                                        ]),
                                    CardCockTailPosition(
                                        borderRadius: _borderRadius),
                                    Positioned(
                                      bottom: 10,
                                        left: 20,
                                        child: Row(
                                      children:<Widget> [
                                        ElevatedButton(
                                            onPressed: (){
                                              _cocktailDetailsGet(context);
                                            },
                                            child: Text("İncele"),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(HexColor("#bbd0ff")),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                            side: BorderSide(color: HexColor("#bbd0ff")),
                                        ),
                                    ))
                                        )],
                                    )
                                    )]
                              )
                          ),
                        );
                      }
                  ),
                ),
              )
        ],
      ),
      bottomNavigationBar: _bottomNavBar(context),
      appBar:  AppBar(
        leading: Icon(Icons.home),

        elevation: 10,
         backgroundColor:  HexColor("#c8b6ff"),
         title:const Text("MumaCock",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
         shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
         bottomRight: Radius.circular(40),
         bottomLeft: Radius.circular(40),
    )
    ),
    ));
  }
}
  _bottomNavBar(context) {
    return Container(
      height: 95,
      child: Stack(
        children: <Widget>[
          Positioned(
           bottom: 0.0,
              child: ClipPath(
                clipper: NavbarCustomClip(),
                child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        HexColor("#c8b6ff"),
                        HexColor("#b8c0ff")
                      ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  )
                ),
              )
          )
      ),
          Positioned(
            bottom: 45,
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget> [
                  _buildNavItem(Icons.local_drink,true),
                  const SizedBox(width: 1),
                  _buildNavItem(Icons.local_drink,false),
                  const SizedBox(width: 1),
                  _buildNavItem(Icons.favorite,false),
                ],
              )
      ),
          Positioned(
            bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:const <Widget>[
                  SizedBox(width:35),
                  Text("Kokteyl Tarifi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                   SizedBox(width:60),
                   Text("Kokteyl Mix",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                   SizedBox(width:50),
                   Text("Favorilerim",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ],
              )
          )
        ],
      ),
    );

}

_buildNavItem(IconData icon, bool active) {
  return ElevatedButton(
    style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: HexColor("#bbd0ff"))
        )
    ),
        backgroundColor: active
            ? MaterialStateProperty.all<Color>(Colors.white)
            : MaterialStateProperty.all<Color>(HexColor("#bbd0ff"))),
   onPressed: (){
   },
    child: CircleAvatar(
      radius: 25,
      backgroundColor:active
          ? Colors.white.withOpacity(0.9)
          : Colors.transparent,
      child: Icon(icon,color: active
          ?Colors.black
          :Colors.white.withOpacity(0.9)),
    ),
  );
}


_cocktailMakerGet(BuildContext context){
  Navigator.of(context).pushNamed("/ShoppingList");
}

_cocktailDetailsGet(BuildContext context){
  Navigator.of(context).pushNamed("/CockTailDetails");
}
