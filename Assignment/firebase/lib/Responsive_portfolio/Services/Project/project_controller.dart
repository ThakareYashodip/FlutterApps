import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectController extends GetxController {
  Future<void> _launchUrlProject(String url, String errorMsg) async {
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

  Future<void> launchCampusCloud() => _launchUrlProject(
        'https://gitlab.com/abhi_core2web/track-tracing-flutter',
        'Could not launch CampusCloud',
      );

  Future<void> launchBinarySearch() => _launchUrlProject(
        'https://gitlab.com/super-yash/binary-search',
        'Could not launch BinarySearch',
      );

  Future<void> launch4wheels() => _launchUrlProject(
        'https://gitlab.com/super-yash/4wheels',
        'Could not launch 4Wheels',
      );
}
