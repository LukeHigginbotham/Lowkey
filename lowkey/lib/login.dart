import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage_list.dart';

class Login extends StatefulWidget {
  const Login ({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _tries = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topCenter,
              child: Image(
                height: 150,
                image: AssetImage('lib/assets/officiallogo.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 40),
              child: Text(
                'LOWKEY',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: 40
                  ),
                  letterSpacing: 1
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50),
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to your Account', 
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w600
                )
                ),
            ),
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.only(top: 20),
              child: const Material(
                elevation: 2,
                child: TextField(
                  //autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none
                    ),
                    labelText: 'Email',
                    hintText: 'tigers@lsu.edu',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.only(top: 25),
              child: const Material(
                elevation: 2,
                shadowColor: Colors.black,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)), 
                      borderSide: BorderSide.none
                    ),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomepageList())
                    ),
              child: Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)), 
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _tries -= 1;
              }),
              child: Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all() 
                ),
                child: const Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            if (_tries <= 0) Container(
              padding: const EdgeInsets.only(top: 20, right: 50),
              alignment: Alignment.topRight,
              child: const Text(
                'Forgot your password?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold
                ),
                ),
            )
          ]
        ),
      )
    );
  }
}


