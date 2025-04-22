/// ---------------------------------------------------------------------------
/// ProfileInfo Widget
/// ---------------------------------------------------------------------------
/// A stateless widget representing a compact, stylish developer profile card
/// typically used in responsive portfolio UIs.
///
/// This widget includes:
/// - A profile avatar (icon-based by default)
/// - User name and role description
/// - Contact information: Email, Phone, and Location
/// - Social media icons for LinkedIn, GitHub, GitLab, and Instagram
///
/// All elements are styled using custom fonts (GoogleFonts) and responsive
/// dimensions via `getScreenWidth`, `getScreenHeight`, and
/// `getResponsiveFontSize` functions.
///
/// The layout uses a vertically structured `Column`, with theming colors
/// suitable for dark-mode UIs.
///
/// Helper method to build a reusable information row (icon + label + value).
///
/// Parameters:
/// - [icon]: The icon to be displayed (can be regular or FontAwesome)
/// - [label]: The label/title for the info (e.g., "Email", "Phone")
/// - [value]: The actual data/content associated with the label
/// - [faIcon]: A boolean indicating whether to use FontAwesome icon or default
///
library;

import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:firebase/Responsive_portfolio/Services/Profile/profile_services.dart';
import 'package:firebase/Responsive_portfolio/View/Profile/profile_Info_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: getScreenWidth(context) * 0.3,
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.02,
          vertical: getScreenHeight(context) * 0.005,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 22, 22, 22),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: getScreenHeight(context) * 0.04),
            Container(
              height: getScreenHeight(context) * 0.22,
              width: getScreenHeight(context) * 0.22,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 39, 39),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            ),
            SizedBox(height: getScreenHeight(context) * 0.015),
            Text(
              "Yashodip Thakare",
              style: GoogleFonts.ibmPlexSerif(
                color: Colors.white,
                fontSize: getResponsiveFontSize(context, 18),
                fontWeight: FontWeight.bold,
                wordSpacing: 1.5,
              ),
            ).increaseSizeOnHover(1.5),
            SizedBox(height: getScreenHeight(context) * 0.01),
            FittedBox(
              child: Container(
                alignment: Alignment.center,
                height: 28,
                width: 110,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 40, 39, 39),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Flutter Developer",
                  style: GoogleFonts.yrsa(
                    color: Colors.white,
                    fontSize: getResponsiveFontSize(context, 8),
                    fontWeight: FontWeight.bold,
                  ),
                ).increaseSizeOnHover(1.5),
              ),
            ),
            SizedBox(height: getScreenHeight(context) * 0.01),
            const Divider(
              color: Color.fromARGB(255, 228, 228, 228),
              thickness: 0.3,
            ),
            SizedBox(height: getScreenHeight(context) * 0.01),

            buildInfoRow(
              context,
              icon: Icons.email,
              label: "Email",
              value: "ganuthakare99@gmail.com",
              onTap: profileController.launchGmail,
            ),

            buildInfoRow(
              context,
              icon: Icons.phone,
              label: "Phone",
              value: "+91 7666556478",
              onTap: profileController.launchPhone,
            ),

            buildInfoRow(
              context,
              icon: Icons.location_on,
              label: "Location",
              value: "Pune, India",
              onTap: profileController.launchLocation,
            ),

            SizedBox(height: getScreenHeight(context) * 0.015),

            // Social Icons Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Linkdin
                  IconButton(
                    onPressed: () {
                      profileController.launchLinkdin();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white70,
                    ),
                  ).increaseSizeOnHover(1.5),
                  // Github
                  IconButton(
                    onPressed: () {
                      profileController.launchGithub();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.squareGithub,
                      color: Colors.white70,
                    ),
                  ).increaseSizeOnHover(1.5),
                  // Gitlab
                  IconButton(
                    onPressed: () {
                      profileController.launchGitLab();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.squareGitlab,
                      color: Colors.white70,
                    ),
                  ).increaseSizeOnHover(1.5),
                  // Instagram
                  IconButton(
                    onPressed: () {
                      profileController.launchInstagram();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.squareInstagram,
                      color: Colors.white70,
                    ),
                  ).increaseSizeOnHover(1.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
