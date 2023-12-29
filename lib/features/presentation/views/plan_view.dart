import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/presentation/views/widgets/plan_item.dart';
import 'package:api_testing/features/presentation/views/widgets/rounded_botton.dart';
import 'package:flutter/material.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key, required this.plan});
  final PlanModel plan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: PlanItem(plan: plan),
            ),
            CustomBottn(
              text: 'Edit Plan',
              ontap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomBottn(
              text: 'Delete Plan',
              ontap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
