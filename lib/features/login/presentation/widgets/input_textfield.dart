import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? prefix;
  final Widget? suffixIcon;
  final bool isObscureText;
  final void Function(String?)? onSave;
  final void Function(String?)? onchange;

  final String? Function(String?)? validator;
  const InputField(
      {super.key,
      this.hintText,
      this.labelText,
      this.prefix,
      this.suffixIcon,
      this.isObscureText = false,
      this.validator,
      this.onSave,
      this.onchange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSave,
      keyboardType: TextInputType.emailAddress,
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: prefix,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: onchange,
    );
  }
}
