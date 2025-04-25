import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePortfolio extends StatelessWidget {
  const AboutMePortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: getScreenHeight(context) * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A passionate Flutter developer with strong expertise in cross-platform apps, REST APIs, UI/UX, widgets, and state management solutions. Proven track record in delivering cutting-edge solutions, including API integration, third-party libraries, and performance optimization. Adept at debugging to ensure high-quality, responsive apps and An agile collaborator committed to staying current with industry trends.",
            textAlign: TextAlign.justify,
            style: GoogleFonts.dmSans(
              fontSize: getResponsiveFontSize(context, 14),
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(211, 255, 255, 255),
              wordSpacing: 1.5,
            ),
          ),
          SizedBox(height: getScreenHeight(context) * 0.05),
          Text(
            "If you're seeking a skilled Flutter developer to breathe life into your project and exceed your expectations, I am here to collaborate and create magic together. Reach out, and let's transform your vision into a reality!",
            textAlign: TextAlign.justify,
            style: GoogleFonts.dmSans(
              fontSize: getResponsiveFontSize(context, 14),
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(211, 255, 255, 255),
              wordSpacing: 1.5,
            ),
          ),
          SizedBox(height: getScreenHeight(context) * 0.025),
          Text(
            "What I'm Doing ",
            textAlign: TextAlign.justify,
            style: GoogleFonts.dmSans(
              fontSize: getResponsiveFontSize(
                  context, getResponsiveFontSize(context, 18)),
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(236, 255, 255, 255),
              wordSpacing: 1.5,
            ),
          ),
          SizedBox(height: getScreenHeight(context) * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildServiceCard(
                context,
                icon: Icons.phone_android_outlined,
                title: "Mobile Apps",
                description:
                    "Professional development of applications for Android and ios.",
              ),
              _buildServiceCard(
                context,
                icon: Icons.web,
                title: "Web Development",
                description:
                    "Professional development of modern and responsive websites.",
              ),
            ],
          ),
          SizedBox(
            height: getScreenHeight(context) * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildServiceCard(
                context,
                icon: Icons.design_services,
                title: "UI/UX Design",
                description:
                    "Designing user-friendly interfaces and experiences.",
              ),
              _buildServiceCard(
                context,
                icon: Icons.storage_outlined,
                title: "Backend Development",
                description: "Building secure and scalable backend systems.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.015,
          vertical: getScreenWidth(context) * 0.005),
      height: getScreenHeight(context) * 0.2,
      width: getScreenWidth(context) * 0.3,
      margin: EdgeInsets.only(bottom: getScreenHeight(context) * 0.005),
      decoration: BoxDecoration(
        color: const Color.fromARGB(246, 22, 22, 22),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.amber.shade400,
            size: getScreenHeight(context) * 0.05,
          ),
          SizedBox(width: getScreenWidth(context) * 0.015),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: getScreenWidth(context) * 0.015,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.dmSans(
                    fontSize: getResponsiveFontSize(
                        context, getResponsiveFontSize(context, 16)),
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(236, 255, 255, 255),
                    wordSpacing: 1,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.dmSans(
                    fontSize: getResponsiveFontSize(context, 14),
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(211, 255, 255, 255),
                    wordSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
