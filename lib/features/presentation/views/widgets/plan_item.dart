import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/presentation/views/widgets/desc_item.dart';
import 'package:flutter/material.dart';

class PlanItem extends StatelessWidget {
  const PlanItem({super.key, required this.plan});
  final PlanModel plan;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                plan.name as String,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${plan.price} \$',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black12,
                ),
              ),
              Column(
                children: List.generate(
                  plan.planDesc!.length,
                  (index) => DescItem(
                    desc: plan.planDesc![index].desc as String,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
