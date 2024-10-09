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

  /// `Login`
  String get loginAppBar {
    return Intl.message(
      'Login',
      name: 'loginAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginEmail {
    return Intl.message(
      'Email',
      name: 'loginEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPassword {
    return Intl.message(
      'Password',
      name: 'loginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get loginForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get loginCreateAccount1 {
    return Intl.message(
      'Don\'t have an account?',
      name: 'loginCreateAccount1',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get loginCreateAccount2 {
    return Intl.message(
      'Create Account',
      name: 'loginCreateAccount2',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get loginOr {
    return Intl.message(
      'Or',
      name: 'loginOr',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Google`
  String get loginSignGoogle {
    return Intl.message(
      'Sign up with Google',
      name: 'loginSignGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Apple`
  String get loginSignApple {
    return Intl.message(
      'Sign up with Apple',
      name: 'loginSignApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Facebook`
  String get loginSignFacebook {
    return Intl.message(
      'Sign up with Facebook',
      name: 'loginSignFacebook',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get signupAppBar {
    return Intl.message(
      'New Account',
      name: 'signupAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get signupName {
    return Intl.message(
      'Full Name',
      name: 'signupName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signupEmail {
    return Intl.message(
      'Email',
      name: 'signupEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signupPassword {
    return Intl.message(
      'Password',
      name: 'signupPassword',
      desc: '',
      args: [],
    );
  }

  /// `There was an error creating the account. Please try again.`
  String get signupError {
    return Intl.message(
      'There was an error creating the account. Please try again.',
      name: 'signupError',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to the `
  String get signupTerms1 {
    return Intl.message(
      'By creating an account, you agree to the ',
      name: 'signupTerms1',
      desc: '',
      args: [],
    );
  }

  /// `Our Terms and Conditions`
  String get signupTerms2 {
    return Intl.message(
      'Our Terms and Conditions',
      name: 'signupTerms2',
      desc: '',
      args: [],
    );
  }

  /// `Create a New Account`
  String get signupButton {
    return Intl.message(
      'Create a New Account',
      name: 'signupButton',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signupHaveAccount1 {
    return Intl.message(
      'Already have an account?',
      name: 'signupHaveAccount1',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signupHaveAccount2 {
    return Intl.message(
      'Sign in',
      name: 'signupHaveAccount2',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get signupFieldRequired {
    return Intl.message(
      'This field is required',
      name: 'signupFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get signupErrorTitle {
    return Intl.message(
      'Error',
      name: 'signupErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please accept our Terms and Conditions`
  String get signupErrorTerms {
    return Intl.message(
      'Please accept our Terms and Conditions',
      name: 'signupErrorTerms',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get authErrorWeakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'authErrorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get authErrorEmailAlreadyInUse {
    return Intl.message(
      'The account already exists for that email.',
      name: 'authErrorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The email address provided is not valid.`
  String get authErrorInvalidEmail {
    return Intl.message(
      'The email address provided is not valid.',
      name: 'authErrorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Network request failed. Check your internet connection.`
  String get authErrorNetworkRequestFailed {
    return Intl.message(
      'Network request failed. Check your internet connection.',
      name: 'authErrorNetworkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Error creating the account. Try again.`
  String get authErrorCreatingAccount {
    return Intl.message(
      'Error creating the account. Try again.',
      name: 'authErrorCreatingAccount',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get authErrorUserNotFound {
    return Intl.message(
      'No user found for that email.',
      name: 'authErrorUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password.`
  String get authErrorWrongPassword {
    return Intl.message(
      'Incorrect password.',
      name: 'authErrorWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Too many login attempts. Try again later.`
  String get authErrorTooManyRequests {
    return Intl.message(
      'Too many login attempts. Try again later.',
      name: 'authErrorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Error signing in. Try again.`
  String get authErrorSigningIn {
    return Intl.message(
      'Error signing in. Try again.',
      name: 'authErrorSigningIn',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while signing out.`
  String get authErrorSignOut {
    return Intl.message(
      'An error occurred while signing out.',
      name: 'authErrorSignOut',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again.`
  String get authErrorUnexpected {
    return Intl.message(
      'An unexpected error occurred. Please try again.',
      name: 'authErrorUnexpected',
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
