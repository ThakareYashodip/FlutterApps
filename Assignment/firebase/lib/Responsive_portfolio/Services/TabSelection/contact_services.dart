import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactServices {
  // Sending the Message to whatsapp
  // with neatly formatted and store the message with time and date , with unique person id.

  static Future<void> sendMessage(
      String userName, String email, String subject, String message) async {
    // Construct a message body from input values
    final fullMessage = """
Name: $userName
Email: $email
Subject: $subject
Message: $message
""";

    // Encode for URL
    final encodedMessage = Uri.encodeComponent(fullMessage);

    // Your WhatsApp number (with country code, no + or spaces)
    final phone = "917666556478"; // <-- Add your country code!

    // WhatsApp URL to send the message
    final whatsappUrl = "https://wa.me/$phone?text=$encodedMessage";

    try {
      final Uri uri = Uri.parse(whatsappUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw "Could not launch WhatsApp";
      }
    } catch (e) {
      print("Error launching WhatsApp: $e");
    }
  }

  static Future<void> storeData(Map<String, dynamic> data) async {
    DocumentReference<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.collection("").add(data);
  }
}
