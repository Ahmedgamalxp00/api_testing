import 'package:api_testing/core/utils/app_router.dart';
import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/presentation/controllers/plans_cubit/plans_cubit.dart';
import 'package:api_testing/features/presentation/views/widgets/plan_item.dart';
import 'package:api_testing/features/presentation/views/widgets/shimer_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlansCubit, PlansState>(
      builder: (context, state) {
        if (state is PlansSuccess) {
          return CarouselSlider(
            options: CarouselOptions(
              initialPage: state.plans.length - 1,
              aspectRatio: 0.75,
              clipBehavior: Clip.none,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              viewportFraction: 0.7,
            ),
            items: state.plans.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                      onTap: () {
                        context.pushReplacement(AppRouter.kPlanView, extra: i);
                      },
                      child: PlanItem(
                        plan: i,
                      ));
                },
              );
            }).toList(),
          );
        } else if (state is PlansFailure) {
          return Center(
            child: Text(state.erorrMassage),
          );
        } else {
          return ShimmerWidget(
            plan: PlanModel(),
          );
        }
      },
    );
  }
}
