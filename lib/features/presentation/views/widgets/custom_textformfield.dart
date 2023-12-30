import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.hint,
      this.onchanged,
      this.textInputType = TextInputType.text,
      this.initialValue = '',
      this.onFieldSubmitted,
      this.onSaved});
  final String hint;
  final String initialValue;
  final Function(String)? onchanged;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.black54,
        style: const TextStyle(
          fontSize: 18,
        ),
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        maxLines: null,
        initialValue: initialValue,
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return '$hint can\'t be null';
          }
          return null;
        },
        onChanged: onchanged,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(color: Colors.blue),
          label: Text(hint),
          labelStyle: const TextStyle(fontSize: 20, color: Colors.black54),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
