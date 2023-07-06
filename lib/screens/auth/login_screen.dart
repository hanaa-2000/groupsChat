import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:groups_chat/screens/auth/register_screen.dart';
import 'package:groups_chat/shared/constates.dart';
import 'package:groups_chat/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  //TextEditingController ? emailController, passwordController;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child:  Text(
                           'Groups Chat',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Login now to see what they are talking!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset('assets/login.png'),
                  CustomTextField(
                    validator: (val) {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)
                          ? null
                          : "Please enter the valid email";
                    },
                    typeText: TextInputType.emailAddress,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    text: 'Email',
                    icon: Icons.email,
                  ),
                  CustomTextField(
                    typeText: TextInputType.text,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Password must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                    icon: Icons.lock,
                    text: 'Password',
                  ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        elevation: 0,
                        padding:const  EdgeInsets.all(5),
                        backgroundColor:primaryColor ,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                      ) ,
                      onPressed: (){},
                      child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )),
                ),

                  const SizedBox(
                    height: 5,
                  ),


                 ///////    register now
                 Text.rich(TextSpan(
                   text: 'Don\'t have an account ?  ',
                    style:const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                    children:<TextSpan> [
                      TextSpan(
                        style:TextStyle(
                           fontSize: 16,
                           //decoration: TextDecoration.underline,
                           color: primaryColor,
                           fontWeight: FontWeight.w500,
                         ),
                     text: 'Register now',
                        recognizer: TapGestureRecognizer()..onTap=(){

                          nextScreen(context, const RegisterScreen());
                        },

                      ),
                    ],
                  ),
                 ),

                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login(){
    if(formKey.currentState!.validate()){

    }
  }
}
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     const Text(
//       'Don\'t have an account ?  ',
//       style: TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.w300,
//       ),
//     ),
//     Text(
//       'Register now',
//       style: TextStyle(
//         fontSize: 16,
//         decoration: TextDecoration.underline,
//         color: primaryColor,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//   ],
// ),
//
//
//
// Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: GestureDetector(
//                   //     onTap: ()=>login(),
//                   //     child: Container(
//                   //       width: double.infinity,
//                   //       height: 45,
//                   //       decoration: BoxDecoration(
//                   //         borderRadius: BorderRadius.circular(30),
//                   //         color: primaryColor,
//                   //       ),
//                   //       child: const Center(
//                   //         child: Text(
//                   //           'Sign In',
//                   //           style: TextStyle(
//                   //             fontSize: 18,
//                   //             fontWeight: FontWeight.w500,
//                   //             color: Colors.white,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),