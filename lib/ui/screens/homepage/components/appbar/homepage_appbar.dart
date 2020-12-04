import 'package:flutter/material.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/screens/homepage/components/appbar/homepage_app_bar_second_line.dart';

import 'homepage_appbar_first_line.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColors.appbarDivider, width: 0.5)),
            color: Theme.of(context).scaffoldBackgroundColor),
        child: SizedBox.expand(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HomePageAppBarFirstLine(),
              HomePageAppBarSecondLine()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(158.0);
}
