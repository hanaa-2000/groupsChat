import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:groups_chat/screens/auth/login_screen.dart';
import 'package:groups_chat/service/auth_service.dart';

import '../../helper/helper_function.dart';
import '../../shared/constates.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/widgets.dart';
import '../home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fullName = '';
  bool isLoading = false;
AuthService authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
              child: CircularProgressIndicator(
                  color: primaryColor,
                ),
            )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
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
                          'Create your  account now to chat and explore',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset('assets/register.png'),
                        CustomTextField(
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return 'Name can\'n be empty';
                            }
                          },
                          typeText: TextInputType.name,
                          onChanged: (val) {
                            setState(() {
                              fullName = val;
                            });
                          },
                          text: 'Full Name',
                          icon: Icons.person,
                        ),
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
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(5),
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                register();
                              },
                              child: const Text(
                                'Register',
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
                        Text.rich(
                          TextSpan(
                            text: 'Already have an account ? ',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  //decoration: TextDecoration.underline,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                text: 'Login now',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, const LoginScreen());
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

  void register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

     await authService.registerUserWithEmailAndPassword(fullName, email, password).then((value) async {
       if(value==true){
         await HelperFunctions.saveUserLoggedInStatUs(true);
         await HelperFunctions.saveUserName(fullName);
         await HelperFunctions.saveUserEmail(email);

         nextScreenReplacement(context,const HomeScreen());

       }else{
         showSnackBar(context, Colors.red, value);
         setState(() {
           isLoading=false;
         });
       }
     });
    }
  }
}
