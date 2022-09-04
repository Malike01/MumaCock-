import 'package:flutter/material.dart';
import 'package:mumacock/utils/helpers/router_helper.dart';
import 'utils/helpers/locator_helper.dart';

void main() async{
 await initializeLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: getIt<RouterHelper>().generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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


