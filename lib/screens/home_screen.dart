import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:1,vertical: 1),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Groups Chat',

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
