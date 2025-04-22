import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillControllergetx extends GetxController {
  Future<void> _launchUrlSkill(String url, String errorMsg) async {
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
  Future<void> launchDart() => _launchUrlSkill(
        'https://dart.dev/',
        'Could not launch Dart',
      );

  Future<void> launchFlutter() => _launchUrlSkill(
        'https://flutter.dev/?utm_source=google&utm_medium=cpc&utm_campaign=brand_sem&utm_content=apac_in&gad_source=1&gbraid=0AAAAAC-INI_t-UIR3oI7DzNSk8vlFwT98&gclid=Cj0KCQjw_JzABhC2ARIsAPe3ynqtvR3pJzEs78yf4o-R10Ywshc1jh_UoOGredBvBbF8elsyIcZk14waAgE0EALw_wcB&gclsrc=aw.ds',
        'Could not launch Flutter',
      );

  Future<void> launchFirebase() => _launchUrlSkill(
        'https://firebase.google.com/',
        'Could not launch Firebase',
      );

  Future<void> launchPostman() => _launchUrlSkill(
        'https://www.postman.com/',
        'Could not launch Postman',
      );

  Future<void> launchAndroid() => _launchUrlSkill(
        'https://www.android.com/',
        'Could not launch Android',
      );

  Future<void> launchFigma() => _launchUrlSkill(
        'https://www.figma.com/',
        'Could not launch Figma',
      );

  Future<void> launchMySQL() => _launchUrlSkill(
        'https://www.mysql.com/',
        'Could not launch MySQL',
      );

  Future<void> launchJava() => _launchUrlSkill(
        'https://openjdk.org/',
        'Could not launch Java',
      );

  Future<void> launchNodeJS() => _launchUrlSkill(
        'https://nodejs.org/',
        'Could not launch Node.js',
      );
}
