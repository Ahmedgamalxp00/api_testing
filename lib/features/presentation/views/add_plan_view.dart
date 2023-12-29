import 'package:api_testing/features/presentation/views/widgets/add_plan_form.dart';
import 'package:flutter/material.dart';

class AddPlanView extends StatelessWidget {
  const AddPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Plan'),
        scrolledUnderElevation: 0,
      ),
      body: const AddPlanForm(),
    );
  }
}
