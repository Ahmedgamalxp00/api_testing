import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.hint,
      this.onchanged,
      this.textInputType = TextInputType.text});
  final String hint;
  final Function(String)? onchanged;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
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
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 20),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          )),
    );
  }
}
