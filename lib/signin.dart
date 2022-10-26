// import 'dart:js';

import 'package:auth_screen/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class signin_screen extends StatefulWidget {
  const signin_screen({Key? key}) : super(key: key);

  @override
  State<signin_screen> createState() => _signin_screenState();
}

class _signin_screenState extends State<signin_screen> {
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
              signin_button(),
              Gap(7),
              ordivider(),
              Gap(7),
              signup_dialouge(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget titletext(BuildContext context){
      return Padding(padding:
        EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 40,
              decoration: BoxDecoration(
                boxShadow:[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), //color of shadow
                    spreadRadius: 0, //spread radius
                    blurRadius: 5,
                    offset: Offset(0,5),// blur radius
                  ),
                ],
                border: Border.all(color: Colors.grey.shade500,
                width: 1,
                ),
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
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Gap(10),
            RichText(
              text: TextSpan(
                text: "Log in", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 58,
              ),
                children: [TextSpan(
                  text: ".", style: TextStyle(
                  color: Colors.pink.shade300,
                )
                )]
              ),
            ),
          ],
        ),
      );
}

Widget fields(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Email",style:
        TextStyle(
          color: Colors.grey.shade50,
        )
        ,),
      Gap(8),
      TextFormField(
        showCursor: false,
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
          hintText: "kksk@gmail.com",
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
      Text("Password",style:
      TextStyle(
        color: Colors.grey.shade50,
      ),
      ),
      Gap(8),
      TextFormField(
        obscureText: true,
        showCursor: false,
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
          hintText: "Enter your Password",
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

Widget signin_button(){
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
          child: Text("Sign in",
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
      Text("Login with one of the options",
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

Widget signup_dialouge(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> signup_screen()));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",style:
          TextStyle(
            color: Colors.grey.shade500,
            fontSize: 15,
          )
          ,),
        Gap(4),
        Text("Sign up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),)
      ],
    ),
  );
}