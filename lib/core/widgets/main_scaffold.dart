import 'package:flutter/material.dart';
import 'package:horizon_barber/core/utils/app_colors.dart';
import 'package:horizon_barber/core/widgets/custom_app_bar.dart';
import 'package:horizon_barber/core/widgets/custom_bottom_nav_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int currentIndex = 0;
  final List<Widget> screens = [
    Center(child: Text("INÍCIO")),
    Center(child: Text("CORTES")),
    Center(child: Text("AGENDA")),
  ];

  void changeIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.border,
              width: 2.5,
            ), // Custom top border
          ),
        ),
        child: CustomBottomNavBar(
          currentIndex: currentIndex,
          changeIndex: changeIndex,
        ),
      ),
    );
  }
}
