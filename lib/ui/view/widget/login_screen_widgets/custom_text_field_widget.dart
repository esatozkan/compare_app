import 'package:flutter/material.dart';
import '../../../../data/constans/constans.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final bool isPasswordType;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isIcon;
  final IconData icon;
  final bool isRequired;
  final bool isPasswordIcon;
  const CustomTextField({
    Key? key,
    required this.text,
    required this.isPasswordType,
    required this.controller,
    required this.keyboardType,
    this.isIcon = false,
    this.icon = Icons.abc,
    this.isRequired = false,
    this.isPasswordIcon = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText:
          widget.isPasswordIcon == true ? !isVisible : widget.isPasswordType,
      enableSuggestions: !widget.isPasswordType,
      autocorrect: !widget.isPasswordType,
      cursorColor: signScreenItemColor,
      style: TextStyle(
        color: signScreenItemColor.withOpacity(.9),
      ),
      decoration: InputDecoration(
        prefixIcon: widget.isIcon == true
            ? Icon(
                widget.icon,
                color: signScreenSecondItemColor,
              )
            : null,
        suffixIcon: widget.isRequired == true
            ? (widget.isPasswordIcon == true)
                ? IconButton(
                    onPressed: () {
                      setState(
                        () {
                          isVisible = !isVisible;
                        },
                      );
                    },
                    icon: Icon(
                      isVisible == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      "*",
                      style: TextStyle(
                        color: signScreenItemColor.withOpacity(.9),
                        fontSize: 20,
                      ),
                    ),
                  )
            : null,
        suffixIconColor: widget.isRequired == true
            ? signScreenItemColor.withOpacity(.9)
            : null,
        labelText: widget.text,
        labelStyle: TextStyle(
          color: signScreenItemColor.withOpacity(.9),
        ),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: signScreenItemColor.withOpacity(.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
