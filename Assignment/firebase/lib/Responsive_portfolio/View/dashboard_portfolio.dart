import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:firebase/Responsive_portfolio/View/Profile/profile_info.dart';
import 'package:firebase/Responsive_portfolio/View/Sections/tab_selection.dart';
import 'package:flutter/material.dart';

class DashBoardPortfolio extends StatelessWidget {
  const DashBoardPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.035,
            vertical: getScreenHeight(context) * 0.055),
        child: Row(
          spacing: 20,
          children: [
            Expanded(
              flex: 3,
              child: ProfileInfo(),
            ),
            Expanded(
              flex: 9,
              child: TabControllerCustom(),
            )
          ],
        ),
      ),
    );
  }
}
