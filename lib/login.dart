import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_seven/HomePage.dart';
import 'package:project_seven/signup.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String mail ='';
  String password ='';
  bool Passive = false;

 // String Mail = '';
 // String pswd = '';

  void MailSave(String text) {
    setState(() {
      mail = text;
    });
  }
  void PasswordSave(String text) {
    setState(() {
      password = text;
    });
  }


  void Control() {
    if (password.length == 0 || mail.length == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else if (password.length > 3 && mail.length > 4) {
      Passive = true;
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => HomePage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
   // List<dynamic>? data=[];
   // data=ModalRoute.of(context)?.settings.arguments as List?;
   // mail=data![0];
   // password=data[1];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    Text("Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Login to your account",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 40,),
                  child: Column(
                    children: <Widget>[
                      makeInput(label: "Email"),
                      makeInputPWD(label: "Password", obscureText: true,)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40,),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: 400, /*minWidth: double.infinity,*/
                      height: 60,
                      onPressed: Passive ? null : Control,
                      color: Colors.greenAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text("Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    Text("Sign Up!", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18,
                    ),),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeInput({label,}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),),
        SizedBox(height: 5,),
        TextField(
          onChanged: MailSave,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            )
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
  Widget makeInputPWD({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),),
        SizedBox(height: 5,),
        TextField(
          onChanged: PasswordSave,
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              )
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}
