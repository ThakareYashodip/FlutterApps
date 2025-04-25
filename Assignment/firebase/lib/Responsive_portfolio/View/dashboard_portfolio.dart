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
          vertical: getScreenHeight(context) * 0.055,
        ),
        child: Row(
          children: [
            // Conditionally display ProfileInfo based on screen width
            if (getScreenWidth(context) > 900) // Only show on larger screens
              Expanded(
                flex: 3, // Adjust the flex for larger screens
                child: ProfileInfo(),
              ),

            // TabControllerCustom always takes remaining space
            Expanded(
              flex: (getScreenWidth(context) > 900)
                  ? 8
                  : 1, // Adjust flex based on screen width
              child: TabControllerCustom(),
            ),
          ],
        ),
      ),
    );
  }
}
