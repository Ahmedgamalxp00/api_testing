import 'package:api_testing/core/utils/app_router.dart';
import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/data/models/channel/plan_desc.model.dart';
import 'package:api_testing/features/data/models/channel/telegram_group.model.dart';
import 'package:api_testing/features/presentation/controllers/add_cubit/add_plan_cubit.dart';
import 'package:api_testing/features/presentation/controllers/delete_cubit/delete_plan_cubit.dart';
import 'package:api_testing/features/presentation/views/widgets/custom_textformfield.dart';
import 'package:api_testing/features/presentation/views/widgets/rounded_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdatePlanForm extends StatelessWidget {
  const UpdatePlanForm({super.key, required this.oldplan});
  final PlanModel oldplan;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    bool isloading = false;
    PlanModel newplan = PlanModel(
      nameChannel: oldplan.nameChannel,
      name: oldplan.name,
      discount: oldplan.discount,
      price: oldplan.price,
      percentage1: oldplan.percentage1,
      numberBot: oldplan.numberBot,
      planDesc: [
        PlanDesc(desc: "New Description 1"),
        PlanDesc(desc: "New Description 2"),
      ],
      telegramGroups: [
        TelegramGroup(
          id: 12,
          title: "New Group",
          merchant: "-100123456789",
          token: "1234567890:ABCDEF123456",
        ),
      ],
    );
    return BlocConsumer<AddPlanCubit, AddPlanState>(
      listener: (context, state) {
        if (state is AddPlanSuccess) {
          context.go(AppRouter.kHomeView);
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
                      newplan.name = value;
                      newplan.nameChannel = value;
                    },
                    initialValue: oldplan.name as String,
                    textInputType: TextInputType.name,
                    hint: 'Name',
                  ),
                  CustomFormField(
                    onchanged: (value) {
                      newplan.price = int.parse(value);
                    },
                    initialValue: oldplan.price.toString(),
                    textInputType: TextInputType.number,
                    hint: 'Price',
                  ),
                  CustomFormField(
                    onchanged: (value) {
                      newplan.discount = int.parse(value);
                    },
                    initialValue: oldplan.discount.toString(),
                    textInputType: TextInputType.number,
                    hint: 'Discount',
                  ),
                  CustomFormField(
                    onchanged: (value) {
                      newplan.numberBot = int.parse(value);
                    },
                    textInputType: TextInputType.number,
                    initialValue: oldplan.numberBot.toString(),
                    hint: 'Number of bots',
                  ),
                  CustomFormField(
                    onchanged: (value) {
                      newplan.percentage1 = value;
                    },
                    textInputType: TextInputType.number,
                    initialValue: oldplan.percentage1 as String,
                    hint: 'Percentage 1',
                  ),
                  // CustomFormField(
                  //   onchanged: (value) {

                  //   },
                  //   initialValue: oldplan.planDesc?[0].desc as String,
                  //   hint: 'Describtion 1',
                  // ),
                  // CustomFormField(
                  //   onchanged: (value) {

                  //   },
                  //   initialValue: oldplan.planDesc?[1].desc as String,
                  //   hint: 'Describtion 2',
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomBottn(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await BlocProvider.of<AddPlanCubit>(context)
                            .addPlan(plan: newplan);
                        await BlocProvider.of<DeletePlanCubit>(context)
                            .deletePlan(id: oldplan.id as int);

                        // print('===========================================');
                      }
                    },
                    width: double.infinity,
                    child: isloading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Edit Plan',
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
