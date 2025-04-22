import 'package:firebase/Responsive_portfolio/ResponsivePortfollio/responsive_font_size.dart';
import 'package:firebase/Responsive_portfolio/Services/TabSelection/contact_services.dart';
import 'package:firebase/Responsive_portfolio/Services/custom_widgets.dart';
import 'package:firebase/Responsive_portfolio/Services/TabSelection/tab_controller_getx.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactMePortfolio extends StatelessWidget {
  const ContactMePortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllerGetx tabControllerGetx = Get.put(ControllerGetx());

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: getScreenWidth(context) * 0.005),
        child: Column(
          spacing: getScreenWidth(context) * 0.025,
          children: [
            // Contact Me
            Row(
              children: [
                FaIcon(FontAwesomeIcons.solidMessage),
                SizedBox(
                  width: getScreenHeight(context) * 0.025,
                ),
                customStyledText(
                  context,
                  "Contact Me",
                  Colors.white,
                  20,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Full Name
                SizedBox(
                  width: getScreenWidth(context) * 0.28,
                  child: Obx(() => TextField(
                        controller: tabControllerGetx.nameController,
                        onChanged: (value) =>
                            tabControllerGetx.name.value = value,
                        decoration: _inputDecoration(
                            "Full name", tabControllerGetx.name.value, context),
                      )),
                ),
                // Email Id
                SizedBox(
                  width: getScreenWidth(context) * 0.28,
                  child: Obx(() => TextField(
                        controller: tabControllerGetx.emailController,
                        onChanged: (value) =>
                            tabControllerGetx.email.value = value,
                        decoration: _inputDecoration("Email address",
                            tabControllerGetx.email.value, context),
                      )),
                ),
              ],
            ),
            // Subject
            Obx(() => TextField(
                  controller: tabControllerGetx.subjectController,
                  onChanged: (value) => tabControllerGetx.subject.value = value,
                  maxLines: 2,
                  decoration: _inputDecoration(
                      "Subject", tabControllerGetx.subject.value, context),
                )),

            // Message Body
            Obx(() => TextField(
                  controller: tabControllerGetx.messageController,
                  onChanged: (value) => tabControllerGetx.message.value = value,
                  maxLines: 6,
                  decoration: _inputDecoration(
                      "Your Message", tabControllerGetx.message.value, context),
                )),

            // Send Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() => GestureDetector(
                      onTap: (tabControllerGetx.name.value.isNotEmpty &&
                              tabControllerGetx.email.value.isNotEmpty &&
                              tabControllerGetx.subject.value.isNotEmpty &&
                              tabControllerGetx.message.value.isNotEmpty)
                          ? () {
                              ContactServices.sendMessage(
                                tabControllerGetx.name.value,
                                tabControllerGetx.email.value,
                                tabControllerGetx.subject.value,
                                tabControllerGetx.message.value,
                              );
                              tabControllerGetx.clearForm();
                              Get.snackbar(
                                "Success",
                                "Message sent successfully!",
                                icon: FaIcon(FontAwesomeIcons.message),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                duration: Duration(seconds: 5),
                              );
                            }
                          : null, // Disable button when fields are empty
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getScreenWidth(context) * 0.009),
                        height: getScreenHeight(context) * 0.08,
                        width: getScreenHeight(context) * 0.2,
                        margin: EdgeInsets.only(
                            bottom: getScreenHeight(context) * 0.005),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 22, 22, 22),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-0.2, -0.2),
                              color: Colors.white70,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationArrow,
                              size: getScreenWidth(context) * 0.009,
                            ),
                            SizedBox(
                              width: getScreenWidth(context) * 0.002,
                            ),
                            Text(
                              "Send Message",
                              style: GoogleFonts.dmSans(
                                color: Colors.amber.shade300,
                                fontSize: getResponsiveFontSize(context, 12),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText, String value, context) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.dmSans(
        fontSize: getResponsiveFontSize(context, 18),
        color: Colors.white54,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      prefix: Text("  "),
      // errorText:
      //     value.isEmpty ? "Field cannot be empty" : null, // Show error if empty
    );
  }
}
