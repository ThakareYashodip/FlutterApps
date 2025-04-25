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
import 'package:blinking_text/blinking_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                    height: getScreenHeight(context) * 0.22,
                    width: getScreenHeight(context) * 0.22,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 40, 39, 39),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://raw.githubusercontent.com/ThakareYashodip/FlutterApps/master/Assignment/firebase/assets/Ganu.png',
                        fit: BoxFit.cover,
                        height: getScreenHeight(context) * 0.17,
                        width: getScreenHeight(context) * 0.17,
                      ),
                    )),
                Positioned(
                  bottom: -20,
                  right: 5,
                  child: BlinkText(
                    '•',
                    style: TextStyle(
                        fontSize: getResponsiveFontSize(context, 40),
                        color: Color.fromARGB(255, 4, 255, 0)),
                    endColor: Colors.green,
                  ),
                ),
              ],
            ),
            Text(
              "Yashodip Raju Thakare",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: getResponsiveFontSize(context, 16),
                fontWeight: FontWeight.bold,
                wordSpacing: 1.5,
              ),
            ).increaseSizeOnHover(1.5),
            Container(
              alignment: Alignment.center,
              height: getScreenHeight(context) * 0.030,
              width: getScreenHeight(context) * 0.18,
              padding: EdgeInsets.all(getScreenHeight(context) * 0.005),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 39, 39),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "Flutter Developer",
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: getResponsiveFontSize(context, 8),
                  fontWeight: FontWeight.bold,
                ),
              ).increaseSizeOnHover(1.5),
            ),
            const Divider(
              color: Color.fromARGB(255, 228, 228, 228),
              thickness: 0.3,
            ),

            buildInfoRow(
              context,
              icon: Icons.email,
              label: "Email",
              value: "ganuthakare...",
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
