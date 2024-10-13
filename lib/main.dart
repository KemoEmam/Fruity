import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruity/core/router/on_generate_route.dart';
import 'package:fruity/core/services/custom_bloc_observer.dart';
import 'package:fruity/core/services/service_locator.dart';
import 'package:fruity/core/services/shared_prefs_service.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/features/splash/presentation/views/splash_view.dart';
import 'package:fruity/firebase_options.dart';
import 'package:fruity/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefsService.init();
  serviceLocator();
  Bloc.observer = CustomBlocObserver();
  runApp(const Fruity());
}

class Fruity extends StatelessWidget {
  const Fruity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),
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
