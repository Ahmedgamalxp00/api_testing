import 'package:api_testing/core/utils/app_router.dart';
import 'package:api_testing/features/presentation/views/widgets/add_plan_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPlanView extends StatelessWidget {
  const AddPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go(AppRouter.kHomeView);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
            )),
        centerTitle: true,
        title: const Text('Add Plan'),
        scrolledUnderElevation: 0,
      ),
      body: const AddPlanForm(),
    );
  }
}
