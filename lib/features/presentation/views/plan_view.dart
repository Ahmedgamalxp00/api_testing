import 'package:api_testing/core/utils/app_router.dart';
import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/presentation/controllers/delete_cubit/delete_plan_cubit.dart';
import 'package:api_testing/features/presentation/controllers/plans_cubit/plans_cubit.dart';
import 'package:api_testing/features/presentation/views/widgets/plan_item.dart';
import 'package:api_testing/features/presentation/views/widgets/rounded_botton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key, required this.plan});
  final PlanModel plan;

  @override
  Widget build(BuildContext context) {
    bool isloading = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go(AppRouter.kHomeView);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
            )),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<DeletePlanCubit, DeletePlanState>(
        listener: (BuildContext context, DeletePlanState state) {
          if (state is DeletePlanSuccess) {
            BlocProvider.of<PlansCubit>(context).getAllPlans();
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Plan delated successfully',
              btnOkOnPress: () {
                context.go(AppRouter.kHomeView);
              },
            ).show();
          } else if (state is DeletePlanFailure) {
            print(state.erorrMassage);
          } else if (state is DeletePlanLoading) {
            isloading = true;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: PlanItem(plan: plan),
                ),
                CustomBottn(
                  ontap: () {
                    context.push(AppRouter.kUpdatePlanView, extra: plan);
                  },
                  width: double.infinity,
                  child: const Text(
                    'Edit Plan',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBottn(
                  ontap: () async {
                    await BlocProvider.of<DeletePlanCubit>(context)
                        .deletePlan(id: plan.id as int);
                  },
                  width: double.infinity,
                  child: isloading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Delete Plan',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
