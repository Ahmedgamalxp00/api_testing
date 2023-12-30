import 'package:api_testing/core/utils/app_router.dart';
import 'package:api_testing/features/presentation/controllers/plans_cubit/plans_cubit.dart';
import 'package:api_testing/features/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
