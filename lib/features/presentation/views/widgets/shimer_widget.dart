import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/presentation/views/widgets/plan_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.plan});
  final PlanModel plan;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: const Color.fromARGB(255, 235, 235, 235),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: PlanItem(
            plan: plan,
          ),
        ));
  }
}
