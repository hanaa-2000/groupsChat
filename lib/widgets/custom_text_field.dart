import 'package:flutter/material.dart';
import 'package:groups_chat/shared/constates.dart';
import 'package:sizer/sizer.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.text, required this.typeText, this.isObscure=false, this.onChanged, this.icon, this.validator, }) : super(key: key);
final String text;
final TextInputType typeText;
 final bool isObscure;
 final IconData? icon;
 final String? Function(String?)? validator;
 //final TextEditingController controller;
 final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        validator:validator ,
        onChanged: onChanged,
        //controller:controller ,
        cursorColor: primaryColor,
        keyboardType: typeText,
        obscureText: isObscure,
        maxLines: 1,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          prefixIconColor: primaryColor,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: primaryColor
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.redAccent
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: text,
          label: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder:OutlineInputBorder(
            borderSide: BorderSide(
                color: primaryColor
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
