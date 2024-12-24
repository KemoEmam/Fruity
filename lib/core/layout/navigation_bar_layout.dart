import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity/core/helper/functions.dart';
import 'package:fruity/core/layout/destination_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

//*add the package persistent_bottom_nav_bar & destination_entity
class NavigationBarLayout extends StatefulWidget {
  const NavigationBarLayout({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  State<NavigationBarLayout> createState() => _NavigationBarLayoutState();
}

class _NavigationBarLayoutState extends State<NavigationBarLayout> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        PersistentTabController(initialIndex: widget.shell.currentIndex);
  }

  @override
  void didUpdateWidget(covariant NavigationBarLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller.index != widget.shell.currentIndex) {
      _controller.jumpToTab(widget.shell.currentIndex);
    }
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return getDestinationEntity(context).map((destination) {
      return PersistentBottomNavBarItem(
        icon: Padding(
          padding: EdgeInsets.only(left: isArabic() ? 6 : 0),
          child:
              SvgPicture.asset(destination.activeIcon, width: 30, height: 30),
        ),
        inactiveIcon: SvgPicture.asset(
          destination.icon,
          width: 24,
          height: 24,
        ),
        title: destination.label,
        activeColorPrimary: Colors.teal,
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
            .map(
              (destination) => destination.screen,
            )
            .toList(),
        items: _navBarItems(),
        navBarHeight: 65,
        backgroundColor: Colors.white,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        navBarStyle: NavBarStyle.style1,
        onItemSelected: (index) {
          widget.shell.goBranch(index); // Sync navigation shell
        },
      ),
    );
  }
}
