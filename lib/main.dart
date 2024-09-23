import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruity/core/helper/functions/on_generate_route.dart';
import 'package:fruity/core/services/shared_prefs_service.dart';
import 'package:fruity/features/splash/presentation/views/splash_view.dart';
import 'package:fruity/generated/l10n.dart';

void main() async {
  await SharedPrefsService.init();
  runApp(const Fruity());
}

class Fruity extends StatelessWidget {
  const Fruity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ar'),
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
