import 'package:api_testing/core/constants.dart';
import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/presentation/views/widgets/custom_textformfield.dart';
import 'package:api_testing/features/presentation/views/widgets/rounded_botton.dart';
import 'package:flutter/material.dart';

class AddPlanForm extends StatefulWidget {
  const AddPlanForm({super.key});

  @override
  State<AddPlanForm> createState() => _AddPlanFormState();
}

class _AddPlanFormState extends State<AddPlanForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    PlanModel? plan;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomFormField(
                  onchanged: (value) {
                    plan!.name = value;
                  },
                  textInputType: TextInputType.name,
                  hint: 'Name',
                ),
                CustomFormField(
                  onchanged: (value) {
                    plan!.price = value as int;
                  },
                  textInputType: TextInputType.number,
                  hint: 'Price',
                ),
                CustomFormField(
                  onchanged: (value) {
                    plan!.numberBot = value as int;
                  },
                  textInputType: TextInputType.number,
                  hint: 'Number of bots',
                ),
                CustomFormField(
                  onchanged: (value) {
                    plan!.numberBot = value as int;
                  },
                  textInputType: TextInputType.number,
                  hint: 'Percentage 1',
                ),
                CustomFormField(
                  onchanged: (value) {
                    plan!.planDesc![0].desc = value;
                  },
                  hint: 'Describtion 1',
                ),
                CustomFormField(
                  onchanged: (value) {
                    plan!.planDesc![1].desc = value;
                  },
                  hint: 'Describtion 2',
                ),
                CustomBottn(
                  text: 'Add Plan',
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print('===========================================');
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
