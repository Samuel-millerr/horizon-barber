import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/features/home/widgets/home_body.dart';
import 'package:horizon_barber/features/home/widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.bg,
        child: Column(children: [HomeHeader(), HomeBody()]),
      ),
    );
  }
}
