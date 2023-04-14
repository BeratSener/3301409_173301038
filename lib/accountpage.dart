import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'login.dart';
import 'signup.dart';
import 'cart.dart';
import 'landingpage.dart';
import 'signup2.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String name ='';
  String surname ='';
  String adress ='';
  String phone= '';


  @override
  Widget build(BuildContext context) {
    List<dynamic>? data=[];
    data=ModalRoute.of(context)?.settings.arguments as List?;
    name=data![0];
    surname=data[1];
    adress=data[2];
    phone=data[3];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text("Account", style: TextStyle(color: Colors.grey, fontSize: 25),),
        actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => HomePage()));
              },
              icon: Icon(Icons.home_filled, color: Colors.lightGreenAccent,),
            ),
        // IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(
        //         builder: (context) => AccountPage()));
        //   },
        //   icon: Icon(Icons.account_circle, color: Colors.black,),
        // ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => LandingPage()));
            },
            icon: Icon(Icons.exit_to_app, color: Colors.black,),
          ),
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.notifications_none, color: Colors.black,),
        // ),
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
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Name : " + name, style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                color: Colors.deepOrangeAccent
              ),),
              SizedBox(height: 20,),
              Text("Surname : "+ surname, style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.deepOrangeAccent
              ),),
              SizedBox(height: 20,),
              Text("Adress : "+ adress, style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Colors.brown
              ),),
              SizedBox(height: 20,),
              Text("Phone : "+ phone, style: TextStyle( //phone Bozuldu ama nerede????
                  fontWeight: FontWeight.w400,          // Fixed
                  fontSize: 22,
                  color: Colors.blueGrey
              ),),
              SizedBox(height: 50,),
              MaterialButton(
                minWidth: 400, /*minWidth: double.infinity,*/
                height: 60,
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SSignupPage()
                  ));
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(" Edit Your Profile ", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
