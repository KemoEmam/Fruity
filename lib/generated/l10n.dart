// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get onboardingSkip {
    return Intl.message(
      'Skip',
      name: 'onboardingSkip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get onboarding1Title1 {
    return Intl.message(
      'Welcome to',
      name: 'onboarding1Title1',
      desc: '',
      args: [],
    );
  }

  /// `HUB`
  String get onboarding1Title2 {
    return Intl.message(
      'HUB',
      name: 'onboarding1Title2',
      desc: '',
      args: [],
    );
  }

  /// `Fruit`
  String get onboarding1Title3 {
    return Intl.message(
      'Fruit',
      name: 'onboarding1Title3',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality`
  String get onboarding1Subtitle {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality',
      name: 'onboarding1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get onboarding2Title {
    return Intl.message(
      'Search and Shop',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `We bring you the best handpicked fruits. Check out the details, photos and reviews to make sure you choose the perfect fruit.`
  String get onboarding2Subtitle {
    return Intl.message(
      'We bring you the best handpicked fruits. Check out the details, photos and reviews to make sure you choose the perfect fruit.',
      name: 'onboarding2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onboardingButton {
    return Intl.message(
      'Get Started',
      name: 'onboardingButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
