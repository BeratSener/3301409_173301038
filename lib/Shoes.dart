import 'package:flutter/material.dart';
import 'package:project_seven/cart.dart';
import 'package:project_seven/accpass.dart';

class ShoesPop extends StatefulWidget {
  final String image;
  const ShoesPop({super.key, required this.image});

  @override
  State<ShoesPop> createState() => _ShoesPopState();
}

class _ShoesPopState extends State<ShoesPop> {
  bool addCartRed = false;
  bool _isFavoritaded = false;
  int _favCount = 0;

  void toggleCartRed () {
    setState(() {
      if (addCartRed) {
        addCartRed = false;
      } else {
        addCartRed = true;
      }
    });
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavoritaded) {
        _favCount -= 1;
        _isFavoritaded = false;
      } else {
        _favCount += 1;
        _isFavoritaded = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: 'red',
          child: Container(
            height: MediaQuery.of(context).size.height, // Buraya Dön web app için
            width: MediaQuery.of(context).size.width, // Buraya Dön web app için
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    child: ListView(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Container(
                              width: 35,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: (_isFavoritaded
                                    ? const Icon(Icons.favorite)
                                    : const Icon(Icons.favorite_border)),
                                color: Colors.red,
                                onPressed: _toggleFavorite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.0),
                      ]),
                    ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Sneakers", style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 25,),
                      Text("Size", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("40", style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("42", style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 20),
                            child: Center(
                              child: Text("44", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 20),
                            child: Center(
                              child: Text("46", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: () {
                              toggleCartRed();
                              Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context) => CartPage()));
                            },
                            child: Text("Buy Now", style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),),
              //  Text(
              //    "100\$",
              //    style: TextStyle(
              //      color: Colors.white,
              //      fontWeight: FontWeight.bold,
              //      fontSize: 22,
              //    ),
              //  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
