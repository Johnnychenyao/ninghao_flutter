import 'package:flutter/material.dart';
import 'package:ninghao_flutter_master/pages/i18n/map/i18n_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              // Localizations.of(context, I18nLocalizations).title
              I18nLocalizations.of(context).title
            )
          ],
        )
      ),
    );
  }
}