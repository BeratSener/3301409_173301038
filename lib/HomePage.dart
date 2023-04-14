import 'package:flutter/material.dart';
import 'package:project_seven/Shoes.dart';
import 'package:project_seven/accountpage.dart';
import 'package:project_seven/accpass.dart';
import 'package:project_seven/cart.dart';
import 'package:project_seven/landingpage.dart';
import 'package:project_seven/login.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFavoritaded = false;
  //int _favCount = 0;// fav Count sonra
// fav Count sonra
  void _toggleFavorite() {// fav Count sonra
    setState(() {// fav Count sonra
      if (_isFavoritaded) {// fav Count sonra
        //_favCount -=1; // fav Count sonra
        _isFavoritaded = false;// fav Count sonra
      } else {// fav Count sonra
        //_favCount +=1;// fav Count sonra
        _isFavoritaded = true;// fav Count sonra
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
        title: Text("Shoes", style: TextStyle(color: Colors.black, fontSize: 25),),
        actions: <Widget>[
       //  IconButton(
       //    onPressed: () {
       //      Navigator.push(
       //          context, MaterialPageRoute(
       //          builder: (context) => HomePage()));
       //    },
       //    icon: Icon(Icons.home_filled, color: Colors.lightGreenAccent,),
       //  ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => Pass()));
            },
            icon: Icon(Icons.account_circle, color: Colors.blue.shade100,),
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
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_cart, color: Colors.black,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(// 1. A_R
                      aspectRatio: 2.2/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("All", style: TextStyle(
                            fontSize: 20,
                          ),),
                        ),
                      ),
                    ),
                    AspectRatio(// 2. A_R
                      aspectRatio: 2.2/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("Sneakers", style: TextStyle(
                            fontSize: 17,
                          ),),
                        ),
                      ),
                    ),
                    AspectRatio(// 3. A_R
                      aspectRatio: 2.2/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("Football", style: TextStyle(
                            fontSize: 17,
                          ),),
                        ),
                      ),
                    ),
                    AspectRatio(// 4. A_R
                      aspectRatio: 2.2/1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("Sport", style: TextStyle(
                            fontSize: 17,
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
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
          width: MediaQuery.of(context).size.width, // Buraya Dön web app için
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
                              Text("Running", style: TextStyle(
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
