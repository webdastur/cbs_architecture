import 'package:aliftech_task/data/config/const/size_const.dart';
import 'package:aliftech_task/data/utils/app_color_utils.dart';
import 'package:aliftech_task/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class AppNavigationBarItem extends StatelessWidget {
  const AppNavigationBarItem({
    required this.onPressed,
    required this.icon,
    required this.title,
    this.isActive = false,
  });

  final IconData icon;
  final bool isActive;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 9),
        child: Column(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 30,
                color: isActive ? AppColorUtils.BLUE : AppColorUtils.DARK_BLUE,
              ),
            ),
            AppWidgets.textLocale(
              localeKey: title,
              fontSize: isActive ? SizeConst.FONT_14 : SizeConst.FONT_12,
              color: isActive ? Colors.black : Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
