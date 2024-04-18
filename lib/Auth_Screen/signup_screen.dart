import 'package:firebase_micro_programmer/Auth_Screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/scondsignup.png'),
            fit: BoxFit.cover,
          )),
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
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.40,
                left: 50,
                child: Text(
                  'Account',
                  style: TextStyle(
                      color: Color(0xffAA076B),
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.47,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
                        controller: passwordController,
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
                bottom: 180,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignInScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                right: 30,
                child: GestureDetector(
                  onTap: () async {
                    showDialog(context: context, builder: (context) {
                      
                      return AlertDialog(
                        
                        title: Text('Logging In'),
                        content: Column(
mainAxisSize: MainAxisSize.min,
                          children: [

                            SpinKitDualRing(color: Color(0xffAA076B)),
                       SizedBox(height: 10,),
                      Text('Logging in, please wait...'),


                          ],
                        ),

                      );
                      
                    },);
                    
                    
                    var response = await context.read<AuthProvider>().signUp(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                    print(response);
                    await ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response.toString())),
                    );


                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignInScreen();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16),
                      Image.asset('images/Arrow.png'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
