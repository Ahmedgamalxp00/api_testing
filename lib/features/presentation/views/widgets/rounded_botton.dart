import 'package:flutter/material.dart';

class CustomBottn extends StatelessWidget {
  const CustomBottn(
      {super.key, this.ontap, required this.child, required this.width});
  final Function()? ontap;
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      height: 50,
      width: width,
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: ontap,
          child: child),
    );
  }
}
