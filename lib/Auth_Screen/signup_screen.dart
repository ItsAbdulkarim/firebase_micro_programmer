

import 'package:firebase_micro_programmer/Auth_Screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

 SignUpScreen({super.key});
 final TextEditingController nameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/scondsignup.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.35,
                            left: 50,
                            child: Text(
                              'Create',
                              style: TextStyle(
                                  color: Color(0xffAA076B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            )),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.40,
                            left: 50,
                            child: Text(
                              'Account',
                              style: TextStyle(
                                  color: Color(0xffAA076B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            )),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.47,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: Row(
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return SignInScreen();
                                        },
                                      ));
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 100,
                          right: 30,
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Image.asset('images/Arrow.png')
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
