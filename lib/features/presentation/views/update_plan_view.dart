import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/presentation/views/widgets/update_plan_form.dart';
import 'package:flutter/material.dart';

class UpdatePlanView extends StatelessWidget {
  const UpdatePlanView({super.key, required this.plan});
  final PlanModel plan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Plan'),
          scrolledUnderElevation: 0,
        ),
        body: UpdatePlanForm(oldplan: plan));
  }
}
