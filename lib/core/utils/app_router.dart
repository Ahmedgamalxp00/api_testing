import 'package:api_testing/core/utils/services_locator.dart';
import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/presentation/controllers/plans_cubit/plans_cubit.dart';
import 'package:api_testing/features/presentation/views/home_view.dart';
import 'package:api_testing/features/data/repos/home_repo_impl.dart';
import 'package:api_testing/features/presentation/views/plan_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kPlanView = '/PlanView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                PlansCubit(getIt.get<HomeRepoImpl>())..getAllPlans(),
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: kPlanView,
        builder: (context, state) => PlanView(
          plan: state.extra as PlanModel,
        ),
      ),
    ],
  );
}
