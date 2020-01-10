import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class I18nLocalizations {
  final Locale locale;

  I18nLocalizations(this.locale);

  static I18nLocalizations of(BuildContext context) { // 静态方法
    return Localizations.of<I18nLocalizations>(
      context,
      I18nLocalizations
    );
  }

  static Map<String, Map<String, String>> _localized = {
    'en':{
      'title': 'hello'
    },
    'zh': {
      'title': '你好'
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class I18nLocalizationsDelegate extends LocalizationsDelegate<I18nLocalizations> {
  I18nLocalizationsDelegate(); // 构造方法

  @override
  Future<I18nLocalizations> load(Locale locale) { // load方法加载包含本地化资源对象
    return SynchronousFuture<I18nLocalizations>(
      I18nLocalizations(locale)
    );
  }

  @override
  bool isSupported(Locale locale) { // 判断这个类的load方法加载的本地化资源，是否支持本地化语言，如果支持返回true
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<I18nLocalizations> old) { // 重建时会调用这个方法，如果返回true，它会调用load方法，依赖这个本地化资源的小部件都会被重建
    return false;
  }
}