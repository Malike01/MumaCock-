import 'package:flutter/material.dart';
import 'package:mumacock/screens/cockctail_details_page/cocktail_details_view.dart';
import 'package:mumacock/screens/cocktail_maker_page/cocktail_maker_view.dart';
import 'package:mumacock/screens/cocktail_recipe_page/cocktail_recipe_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/CockTailMaker": (context) => const CocktailMakerView(),
        "/CockTailDetails": (context) => const CockTailDetailsView(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const CocktailRecipeView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Container();
  }

}


