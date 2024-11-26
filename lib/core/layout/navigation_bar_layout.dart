import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/core/helper/functions/functions.dart';
import 'package:fruity/core/layout/testos/cart.dart';
import 'package:fruity/core/layout/testos/products.dart';
import 'package:fruity/core/layout/testos/profile.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/home/presentation/views/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'destination_entity.dart';

class NavigationBarLayout extends StatefulWidget {
  final Widget? child;
  const NavigationBarLayout({super.key, this.child});

  @override
  State<NavigationBarLayout> createState() => _NavigationBarLayoutState();
}

class _NavigationBarLayoutState extends State<NavigationBarLayout> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        PersistentTabController(initialIndex: 0); // Default to the first tab
  }

  // Map each label to the corresponding view for the bottom navigation bar
  Widget _getScreen(String id) {
    switch (id) {
      case 'home':
        return const HomeView();
      case 'products':
        return const Products();
      case 'cart':
        return const Cart();
      case 'profile':
        return const Profile();
      default:
        return const Scaffold(body: Center(child: Text("Page not found")));
    }
  }

  // Define navigation bar items dynamically from DestinationEntity
  List<PersistentBottomNavBarItem> _navBarItems() {
    return getDestinationEntity(context).map((destination) {
      return PersistentBottomNavBarItem(
        icon: Padding(
          padding: EdgeInsets.only(left: isArabic() ? 6 : 0),
          child:
              SvgPicture.asset(destination.activeIcon, width: 30, height: 30),
        ),
        inactiveIcon: SvgPicture.asset(destination.icon, width: 24, height: 24),
        title: destination.label,
        textStyle: AppTextStyles.cairoSemiBold11,
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: getDestinationEntity(context)
            .map((destination) => _getScreen(destination.id))
            .toList(), // Map destination labels to views
        items: _navBarItems(), // Navigation bar items
        navBarHeight: 70,
        backgroundColor: Colors.white, // Nav bar Background color
        decoration: NavBarDecoration(
          colorBehindNavBar:
              Colors.white, //color behind nav bar when have radius
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),

        navBarStyle: NavBarStyle.style1,
      ),
    );
  }
}
