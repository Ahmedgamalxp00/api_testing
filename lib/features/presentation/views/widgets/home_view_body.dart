import 'package:api_testing/core/utils/app_router.dart';
import 'package:api_testing/features/presentation/views/widgets/home_slider.dart';
import 'package:api_testing/features/presentation/views/widgets/rounded_botton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const HomeSlider(),
        CustomBottn(
          text: 'Add Plan',
          ontap: () {
           
          },
        ),
      ],
    );
  }
}
