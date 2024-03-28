import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_micro_programmer/Auth_Screen/sign_in_screen.dart';
import 'package:firebase_micro_programmer/Auth_Screen/signup_screen.dart';
import 'package:firebase_micro_programmer/firebase_options.dart';
import 'package:firebase_micro_programmer/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
    return MultiProvider(

      providers: [


        ChangeNotifierProvider(create: (context) {

          return AuthProvider();
        },)



      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  SignUpScreen(),
      ),
    );
  }
}

