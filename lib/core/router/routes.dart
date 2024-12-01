class Routes {
  Routes._();
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String password = '/password';
  //nav bar
  static const String home = '/home';
  static const String products = '/products';
  static const String cart = '/cart';
  static const String profile = '/profile';

//hide nav bar, used for router & navigation:  context.push('/bestSelling'); make sure it is .push not .go
  static const String bestSelling = '/bestSelling';
  //show nav bar, used for router & navigation: Navigator.push(context,MaterialPageRoute(builder: (context) => const BestSellingView(),));
  static const String nestedBestSelling = 'bestSelling';
}
