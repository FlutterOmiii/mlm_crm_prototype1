import 'package:get/get.dart';
import 'languages/en_us.dart';
import 'languages/hi_in.dart';
import 'languages/mr_in.dart';
import 'languages/hinglish.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'hi_IN': hiIN,
        'mr_IN': mrIN,
        'hinglish': hinglish,
      };
}
