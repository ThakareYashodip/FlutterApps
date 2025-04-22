import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  // Reusable URL launcher
  Future<void> _launchUrl(String url, String errorMsg) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw errorMsg;
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Public methods using the helper
  Future<void> launchGmail() => _launchUrl(
        'mailto:ganuthakare99@gmail.com',
        'Could not launch Gmail',
      );

  Future<void> launchPhone() => _launchUrl(
        'tel:+917666556478',
        'Could not launch phone dialer',
      );

  Future<void> launchLocation() => _launchUrl(
        'https://www.google.com/maps/search/?api=1&query=Pune',
        'Could not launch Google Maps',
      );

  Future<void> launchLinkdin() => _launchUrl(
        'https://www.linkedin.com/in/yashodip-raju-thakare-22abb4283/?originalSubdomain=in',
        'Could not launch LinkedIn',
      );

  Future<void> launchGithub() => _launchUrl(
        'https://github.com/ThakareYashodip',
        'Could not launch GitHub',
      );

  Future<void> launchGitLab() => _launchUrl(
        'https://gitlab.com/super-yash',
        'Could not launch GitLab',
      );

  Future<void> launchInstagram() => _launchUrl(
        'https://www.instagram.com/yashodipganu/',
        'Could not launch Instagram',
      );
}
