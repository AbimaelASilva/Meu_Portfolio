import 'package:get/get.dart';

import 'languages/pro_en_us_translate.dart';
import 'languages/pro_es_es_translate.dart';
import 'languages/pro_pt_br_translate.dart';

/// Return all translations
class ProTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': ptBrTranslate,
        'en_US': enUsTranslate,
        'es_ES': esEsTranslate,
      };
}
