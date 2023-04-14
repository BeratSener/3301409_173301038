import 'package:flutter/material.dart';
import 'package:project_seven/accountpage.dart';
import 'package:project_seven/signup2.dart';

class Pass extends StatefulWidget {
  const Pass({Key? key}) : super(key: key);

  @override
  State<Pass> createState() => _PassState();
}

class _PassState extends State<Pass> {
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
                const Text("Your account verification has not been completed.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),),
                SizedBox(height: 20,),
                Text("Please enter your information",
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
                  child: Text("Edit Your Profile", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),),
                ),
              ],
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
