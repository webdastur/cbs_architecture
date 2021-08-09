import 'package:aliftech_task/data/utils/app_color_utils.dart';
import 'package:aliftech_task/ui/widgets/app_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({required this.children});
  final List<AppNavigationBarItem> children;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColorUtils.WHITE,
        boxShadow: [
          BoxShadow(
            color: AppColorUtils.GREY,
            blurRadius: 5,
            spreadRadius: -2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
