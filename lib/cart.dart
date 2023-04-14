import 'package:flutter/material.dart';
import 'package:project_seven/Shoes.dart';
import 'HomePage.dart';
import 'accountpage.dart';
import 'landingpage.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isFavoritaded = false;
  int _favCount = 0;


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

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text("Cart", style: TextStyle(color: Colors.deepPurple, fontSize: 25),),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => HomePage()));
            },
            icon: Icon(Icons.home_filled, color: Colors.lightGreenAccent,),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => AccountPage()));
            },
            icon: Icon(Icons.account_circle, color: Colors.black,),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => LandingPage()));
            },
            icon: Icon(Icons.exit_to_app, color: Colors.black,),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.black,),
          ),
       //  IconButton(
       //    onPressed: () {},
       //    icon: Icon(Icons.shopping_cart, color: Colors.black,),
       //  ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              makeItem(image: "assets/images/one.jpg", tag: 'red', context: context),
              makeItem(image: "assets/images/two.jpg", tag: 'blue', context: context),
              makeItem(image: "assets/images/three.jpg", tag: 'white', context: context),

            ],
          ),
        ),
      ),
    );
  }
  Widget makeItem({image, tag, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => ShoesPop(image: image,)));
        },
        child: Container(
          height: 250,
          width: double.infinity, // Buraya Dön web app için
          padding: EdgeInsets.all(20), // Sneakers yazısı için padding
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Yazıyı kutunun sol üstünden başlatmak için wraplendi,
                      children: [ //  Üstte padding verildi.
                        Column(
                          children: <Widget>[
                            Text("Running Shoe", style: TextStyle(
                              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 10,),
                            Text("Sport", style: TextStyle(
                              color: Colors.white, fontSize: 18,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.add_card, color: Colors.lightGreen,)
                    ),
                ],
              ),
              Text("100\$", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
