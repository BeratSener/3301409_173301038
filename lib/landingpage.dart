import 'package:flutter/material.dart';
import 'package:project_seven/login.dart';
import 'package:project_seven/signup.dart';


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          reverse: true,
          padding: EdgeInsets.all(32),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text("Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),),
                SizedBox(height: 20,),
                Text("Automatic identity verification which enables you to verify your identity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                  ),),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/homepage.png"))
              ),
            ),
            Column(
              children: <Widget>[
                MaterialButton(
                  minWidth: 400, /*minWidth: double.infinity,*/
                  height: 60,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LoginPage()
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text("Login", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black,),
                      top: BorderSide(color: Colors.black,),
                      left: BorderSide(color: Colors.black,),
                      right: BorderSide(color: Colors.black,),
                    ),
                  ),
                  child: MaterialButton(
                    minWidth: 400, /*minWidth: double.infinity,*/
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SignupPage()
                      ));
                    },
                    color: Colors.yellow,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text("Sign Up", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),),
                  ),
                ),
              ],
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}