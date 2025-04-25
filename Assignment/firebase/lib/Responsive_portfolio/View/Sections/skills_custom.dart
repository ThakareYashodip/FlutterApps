import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:firebase/Responsive_portfolio/Services/Skills/skill_controllerGetx.dart';
import 'package:firebase/Responsive_portfolio/Services/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SkillsCustom extends StatelessWidget {
  const SkillsCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final SkillControllergetx skillController = Get.put(SkillControllergetx());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<String> skillImages = [
      "https://aakashrajbanshi.com.np/assets/skills/Dart.svg",
      'https://aakashrajbanshi.com.np/assets/skills/Flutter.svg',
      "https://aakashrajbanshi.com.np/assets/skills/Firebase.svg",
      'https://aakashrajbanshi.com.np/assets/skills/Postman.svg',
      'https://aakashrajbanshi.com.np/assets/skills/AndroidStudio.svg',
      'https://aakashrajbanshi.com.np/assets/skills/Figma.svg',
      // 'https://www.svgrepo.com/show/184143/java.svg',
      // 'https://www.svgrepo.com/show/184138/linux.svg',
    ];

    final List<String> learningSkills = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx25AX0zo1Hxz_tPZ2Oi3GpX9-TfcClBSHLg&s',
      'https://aakashrajbanshi.com.np/assets/skills/Docker.svg',
      'https://aakashrajbanshi.com.np/assets/skills/Kubernetes.svg',

      ///AWS 'https://www.svgrepo.com/show/376356/aws.svg'
    ];

    // Define the list of skill launch functions
    final List<VoidCallback> skillLaunchFunctions = [
      skillController.launchDart,
      skillController.launchFlutter,
      skillController.launchFirebase,
      skillController.launchPostman,
      skillController.launchAndroid,
      skillController.launchFigma,
      skillController.launchJava,
      skillController.launchLinux
    ];

    double cardHeight = screenHeight * 0.26; // Bigger height
    double imageSize = cardHeight * 0.75;

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: getScreenHeight(context) * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customStyledText(
            context,
            'What I Use',
            Colors.white,
            getResponsiveFontSize(context, 18), // Slightly bigger font
          ),
          SizedBox(height: screenHeight * 0.025),
          SizedBox(
            height: cardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              itemCount: skillImages.length,
              separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.025),
              itemBuilder: (_, index) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: skillLaunchFunctions[
                        index], // calls corresponding launch method
                    child: SvgPicture.network(
                      skillImages[index],
                      height: imageSize,
                      width: imageSize,
                      fit: BoxFit.contain,
                    ).increaseSizeOnHover(1.3),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.045),
          customStyledText(
            context,
            'In Progress',
            Colors.white,
            getResponsiveFontSize(context, 18), // Slightly bigger font
          ),
          SizedBox(height: screenHeight * 0.025),
          SizedBox(
            height: cardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              itemCount: learningSkills.length,
              separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.025),
              itemBuilder: (_, index) {
                return CachedNetworkImage(
                  imageUrl: skillImages[index],
                  imageBuilder: (context, imageProvider) => SvgPicture.network(
                    skillImages[index],
                    height: imageSize,
                    width: imageSize,
                    fit: BoxFit.contain,
                  ).increaseSizeOnHover(1.3),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.person_2_outlined),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
