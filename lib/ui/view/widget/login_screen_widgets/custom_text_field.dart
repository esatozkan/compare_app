import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final bool isPasswordType;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isIcon;
  final IconData icon;
  final bool isRequired;

  const CustomTextField({
    Key? key,
    required this.text,
    required this.isPasswordType,
    required this.controller,
    required this.keyboardType,
    this.isIcon = false,
    this.icon = Icons.abc,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white.withOpacity(.9),
      ),
      decoration: InputDecoration(
        prefixIcon: isIcon == true
            ? Icon(
                icon,
                color: Colors.white70,
              )
            : null,
        suffixIcon: isRequired == true
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.9),
                    fontSize: 20,
                  ),
                ),
              )
            : null,
        suffixIconColor:
            isRequired == true ? Colors.white.withOpacity(.9) : null,
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
