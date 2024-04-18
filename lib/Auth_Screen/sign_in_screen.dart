import 'package:firebase_micro_programmer/Auth_Screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController emailControllerr = TextEditingController();
  final TextEditingController passwordControllerr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                          left: 40,
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xffAA076B),
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.45,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 25,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailControllerr,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 15,
                                    ),
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
                                  controller: passwordControllerr,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 15,
                                    ),
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
                          top: MediaQuery.of(context).size.height * 0.63,
                          left: 100,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Forgotten Password?'),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.67,
                          left: 40,
                          right: 0,
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SignUpScreen();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  'Register here',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            onTap: () async {
                              var response =
                              await context.read<AuthProvider>().signIn(
                                emailControllerr.text.trim(),
                                passwordControllerr.text.trim(),
                              );
                              await ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(response.toString())));
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Image.asset('images/Arrow.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
