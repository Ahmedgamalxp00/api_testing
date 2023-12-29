import 'package:api_testing/features/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Plans'),
      ),
      body: const HomeViewBody(),
    );
  }
}
