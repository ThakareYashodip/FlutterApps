import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:firebase/Responsive_portfolio/Services/custom_widgets.dart';
import 'package:firebase/Responsive_portfolio/Services/TabSelection/tab_controller_getx.dart';
import 'package:firebase/Responsive_portfolio/View/Sections/about_me.dart';
import 'package:firebase/Responsive_portfolio/View/Sections/contact_me.dart';
import 'package:firebase/Responsive_portfolio/View/Sections/projects_custom.dart';
import 'package:firebase/Responsive_portfolio/View/Sections/skills_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TabControllerCustom extends StatelessWidget {
  const TabControllerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.put(ControllerGetx());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: getScreenWidth(context) * 0.7,
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.02,
          vertical: getScreenHeight(context) * 0.005,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 22, 22, 22),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: getScreenHeight(context) * 0.025,
                children: [
                  Obx(() {
                    final selectedIndex = tabController.selectedIndexTab.value;
                    final tabTitles = [
                      "About Me",
                      "Skills",
                      "Projects",
                      "Contact"
                    ];
                    return customStyledText(
                      context,
                      tabTitles[selectedIndex], // show current tab title
                      Colors.white,
                      20,
                    );
                  }),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context) * 0.02,
                      vertical: getScreenHeight(context) * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(234, 29, 29, 29),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      spacing: getScreenWidth(context) * 0.025,
                      children: [
                        _tabButton(context, "About Me", 0, tabController),
                        _tabButton(context, "Skills", 1, tabController),
                        _tabButton(context, "Projects", 2, tabController),
                        _tabButton(context, "Contact", 3, tabController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 4,
              color: Colors.amber.shade400,
              endIndent: getScreenWidth(context) * 0.59,
            ),
            SizedBox(height: getScreenHeight(context) * 0.02),
            Expanded(
              child: Obx(() {
                return IndexedStack(
                  index: tabController.selectedIndexTab.value,
                  children: const [
                    AboutMePortfolio(),
                    SkillsCustom(),
                    ProjectsCustom(),
                    ContactMePortfolio(),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(BuildContext context, String text, int index,
      ControllerGetx tabController) {
    return Obx(() {
      bool isSelected = tabController.selectedIndexTab.value == index;
      return TextButton(
        onPressed: () => tabController.updateIndex(index),
        child: Text(
          text,
          style: GoogleFonts.dmSans(
            color: isSelected ? Colors.amberAccent : Colors.white70,
            fontSize: getResponsiveFontSize(context, 14),
            fontWeight: FontWeight.w500,
            wordSpacing: 1.5,
          ),
        ).increaseSizeOnHover(1.2),
      );
    });
  }
}
