// import 'dart:html';

import 'package:auth_screen/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({Key? key}) : super(key: key);

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  bool _isvisible=false;
  bool password_contains_8letters=false;
  bool password_contains_one_number=false;
  passwordchanged(String password){
    final register= RegExp(r'[0-9]');
      setState(() {
        password_contains_8letters=false;
        if(password.length>=8){
          password_contains_8letters=true;
        }
        password_contains_one_number=false;
        if(register.hasMatch(password)){
          password_contains_one_number=true;
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titletext(context),
              Gap(20),
              direct_login_buttons(),
              Gap(20),
              fields(),
              Gap(20),
              Text("Password",style:
              TextStyle(
                color: Colors.grey.shade50,
                fontSize: 18,
              ),
              ),
              Gap(8),
              Text("Please create a secure password using following criteria",style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.grey.shade600,
              ),),
              Gap(10),
              TextFormField(
                onChanged: (pasword)=>passwordchanged(pasword),
                obscureText: !_isvisible,
                showCursor: false,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  hintText: "Create Password",
                  helperStyle: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,color: Colors.grey.shade800,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.pink.shade300,width: 2,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isvisible=!_isvisible;
                      });
                    },
                    icon: _isvisible ? Icon(Icons.visibility,color: Colors.grey.shade300,):
                    Icon(Icons.visibility_off,color: Colors.grey.shade300,),
                  ),
                  fillColor: Colors.grey.shade900,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
                style: TextStyle(
                  color: Colors.grey.shade50,
                  fontSize: 17,
                ),
              ),
              Gap(13),
              Row(
                children: [
                  AnimatedContainer(duration:Duration(microseconds: 500),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: password_contains_8letters ? Colors.pinkAccent:Colors.transparent,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Icon(Icons.check,color: Styles.colour1,size: 10,),),
                  ),
                  Gap(8),
                  Text("Contains at-least 8 characters",style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade400,
                  ),)
                ],
              ),
              Gap(8),
              Row(
                children: [
                  AnimatedContainer(duration:Duration(microseconds: 500),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: password_contains_one_number ? Colors.pinkAccent:Colors.transparent,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Icon(Icons.check,color: Styles.colour1,size: 10,),),
                  ),
                  Gap(8),
                  Text("Contains at-least 1 number",style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade400,
                  ),)
                ],
              ),
              Gap(15),
              create_account_button(),
              Gap(7),
              ordivider(),
              Gap(7),
              login_dialouge(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget titletext(BuildContext context){
  return Padding(padding:
  EdgeInsets.fromLTRB(0, 35, 0, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade500,
            width: 1,
            ),
            boxShadow:[
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), //color of shadow
                spreadRadius: 0, //spread radius
                blurRadius: 5,
                offset: Offset(0,5),// blur radius
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            padding: EdgeInsets.only(bottom: 5,right: 5,top: 3,left: 2),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        Gap(12),
        RichText(
          text: TextSpan(
              text: "Sign up", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 50,
          ),
              children: [TextSpan(
                  text: ".", style: TextStyle(
                color: Colors.pink.shade300,
              )
              ),
                TextSpan(
                    text: ".", style: TextStyle(
                  color: Colors.pink.shade300,
                )
                ),
              ]
          ),
        ),
      ],
    ),
  );
}

Widget fields(){
  var _isVisible=false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Name",style:
      TextStyle(
        color: Colors.grey.shade50,
        fontSize: 18,
      )
        ,),
      Gap(10),
      TextFormField(
        showCursor: false,
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
          hintText: "jeff",
          helperStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              style: BorderStyle.solid,color: Colors.grey.shade800,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.pink.shade300,width: 2,
            ),
          ),
          fillColor: Colors.grey.shade900,
          filled: true,
          contentPadding: EdgeInsets.all(15),
        ),
        style: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 17,
        ),
      ),
      Gap(20),
      Text("Email",style:
      TextStyle(
        color: Colors.grey.shade50,
        fontSize: 18,
      )
        ,),
      Gap(8),
      TextFormField(
        showCursor: false,
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
          hintText: "jeff@gmail.com",
          helperStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              style: BorderStyle.solid,color: Colors.grey.shade800,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.pink.shade300,width: 2,
            ),
          ),
          fillColor: Colors.grey.shade900,
          filled: true,
          contentPadding: EdgeInsets.all(15),
        ),
        style: TextStyle(
          color: Colors.grey.shade50,
          fontSize: 17,
        ),
      ),
    ],
  );
}

Widget create_account_button(){
  return Row(
    children: [
      Expanded(child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft,end: Alignment.centerRight,colors: [Colors.purple,Colors.pink.shade600]),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          onPressed: (){},
          child: Text("Create Account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      )
    ],
  );
}

Widget ordivider(){
  return Row(
    children: [
      Expanded(child:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Divider(
          thickness: 2,
          color: Colors.grey.shade500,
        ),
      ),
      ),
      Text("or",style:
      TextStyle(
        color: Colors.grey.shade500,
      ),
      ),
      Expanded(child:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Divider(
          thickness: 2,
          color: Colors.grey.shade500,
        ),
      ),
      ),
    ],
  );
}

Widget direct_login_buttons(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Signup with one of the options",
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 15,
        ),),
      Gap(10),
      Row(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              border: Border.all(color: Colors.grey.shade800),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              padding: EdgeInsets.only(bottom: 25),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: (){},
              icon: Icon(Icons.g_mobiledata,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),),
          Gap(16),
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              border: Border.all(color: Colors.grey.shade800),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              padding: EdgeInsets.only(bottom: 15),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: (){},
              icon: Icon(Icons.apple,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),)
        ],
      ),
    ],
  );
}

Widget login_dialouge(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.pop(context);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?",style:
        TextStyle(
          color: Colors.grey.shade500,
          fontSize: 15,
        )
          ,),
        Gap(4),
        Text("Log in",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),)
      ],
    ),
  );
}