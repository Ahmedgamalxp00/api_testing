import 'package:api_testing/core/utils/app_router.dart';
import 'package:api_testing/core/utils/block_observer.dart';
import 'package:api_testing/core/utils/services_locator.dart';
import 'package:api_testing/features/data/repos/home_repo_impl.dart';
import 'package:api_testing/features/presentation/controllers/plans_cubit/plans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObsServer();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlansCubit(getIt.get<HomeRepoImpl>()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
