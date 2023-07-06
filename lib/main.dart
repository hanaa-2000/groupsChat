import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groups_chat/screens/auth/login_screen.dart';
import 'package:groups_chat/screens/home_screen.dart';
import 'package:groups_chat/shared/constates.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'helper/helper_function.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignIn =false;

  @override
  void initState() {
    super.initState();

  getUserLoggedInStatus();

  }
  getUserLoggedInStatus()async{
    await HelperFunctions.getUserLoggedInStateUs().then((value){
      if(value != null ){

          _isSignIn=value;


      }
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor:primaryColor,
          ),
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: _isSignIn ?  HomeScreen():LoginScreen(),

    );
  }
}

