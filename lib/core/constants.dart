import 'package:flutter/material.dart';

const String baseUrl = 'https://gfoura.smartidea.tech/api/plan2';

InputBorder myBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black12),
    borderRadius: BorderRadius.circular(30),
    gapPadding: 15,
  );
}

final InputDecoration otpDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);
