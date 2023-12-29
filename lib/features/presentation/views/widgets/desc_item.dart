import 'package:flutter/material.dart';

class DescItem extends StatelessWidget {
  const DescItem({super.key, required this.desc});
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              desc,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Icon(Icons.check),
        ],
      ),
    );
  }
}
