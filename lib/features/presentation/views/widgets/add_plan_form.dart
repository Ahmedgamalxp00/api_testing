import 'package:api_testing/core/utils/app_router.dart';
import 'package:api_testing/features/data/models/channel/channel.model.dart';

import 'package:api_testing/features/presentation/controllers/add_cubit/add_plan_cubit.dart';
import 'package:api_testing/features/presentation/views/widgets/custom_textformfield.dart';
import 'package:api_testing/features/presentation/views/widgets/rounded_botton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddPlanForm extends StatelessWidget {
  const AddPlanForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    bool isloading = false;
    PlanModel plan = PlanModel();
    return BlocConsumer<AddPlanCubit, AddPlanState>(
      listener: (context, state) {
        if (state is AddPlanSuccess) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Plan added successfully',
            btnOkOnPress: () {
              context.go(AppRouter.kHomeView);
            },
          ).show();
        } else if (state is AddPlanFailure) {
          print(state.erorrMassage);
        } else if (state is AddPlanLoading) {
          isloading = true;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  CustomFormField(
                    onchanged: (value) {
                      plan.name = value;
                      plan.nameChannel = value;
                    },
                    textInputType: TextInputType.name,
                    hint: 'Name',
                  ),
                  CustomFormField(
                    onchanged: (value) {
                      plan.price = int.parse(value);
                    },
                    textInputType: TextInputType.number,
                    hint: 'Price',
                  ),
                  CustomFormField(
                    onchanged: (value) {
                      plan.discount = int.parse(value);
                    },
                    textInputType: TextInputType.number,
                    hint: 'Discount',
                  ),
                  CustomFormField(
                    onchanged: (value) {
                      plan.numberBot = int.parse(value);
                    },
                    textInputType: TextInputType.number,
                    hint: 'Number of bots',
                  ),
                  CustomFormField(
                    onchanged: (value) {
                      plan.percentage1 = value;
                    },
                    textInputType: TextInputType.number,
                    hint: 'Percentage 1',
                  ),
                  // CustomFormField(
                  //   onchanged: (value) {},
                  //   hint: 'Describtion 1',
                  // ),
                  // CustomFormField(
                  //   hint: 'Describtion 2',
                  //   onchanged: (value) {},
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomBottn(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await BlocProvider.of<AddPlanCubit>(context)
                            .addPlan(plan: plan);
                      }
                    },
                    width: double.infinity,
                    child: isloading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Add Plan',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ]),
              )),
        );
      },
    );
  }
}
