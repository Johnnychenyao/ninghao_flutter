import 'package:flutter/material.dart';
import 'package:ninghao_flutter_master/pages/i18n/map/i18n_localizations.dart';
import './pages/index_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('zh', 'CN'), //语言设置的方法一
      // localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales){ //语言设置的方法二
      //   return Locale('en', 'US');
      // },
      localizationsDelegates: [
        I18nLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN')
      ],
      title: 'ninghao flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Colors.blueAccent
      ),
      home: IndexPage(),
    );
  }
}