import 'package:flutter/material.dart';

class CockTailDetailsView extends StatefulWidget {
  const CockTailDetailsView({Key? key}) : super(key: key);

  @override
  State<CockTailDetailsView> createState() => _CockTailDetailsViewState();
}

class _CockTailDetailsViewState extends State<CockTailDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}

class Body extends StatelessWidget{
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
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 15,
                    right: 15,
                  ),
                  // height: 500,
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height:100/2),
                      Description(),
                      const SizedBox(height:100/2),
                      CounterWithFavBtn(),
                      const SizedBox(height:100/2),
                    ],
                  ),
                ),
                const ProductTitleWithImage()
              ],
            ),
          )
        ],
      ),
    );
  }

}

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         const Text(
           "Name",
            style: TextStyle(
              fontWeight: FontWeight.bold
            )
          ),
          const SizedBox(height: 100),
          Row(
            children: <Widget>[
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: "Alcolick\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        )),
                    TextSpan(
                      text: "Yes",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
              ),
              const SizedBox(width:100),
              Expanded(
                child: Hero(
                  tag: "",
                  child: Image.asset(
                   "",
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
class CounterWithFavBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding:const EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.favorite_border),
        )
      ],
    );
  }

}

class Description extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Text(
       "Description",
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

