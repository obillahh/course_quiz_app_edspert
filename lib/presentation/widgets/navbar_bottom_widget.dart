import 'package:application_edspert/core/themes/app_grayscale.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NavbarBottomWidget extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const NavbarBottomWidget({super.key, required this.navigationShell});

  @override
  State<NavbarBottomWidget> createState() => _NavbarBottomWidgetState();
}

class _NavbarBottomWidgetState extends State<NavbarBottomWidget> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.navigationShell),
      bottomNavigationBar: ConvexAppBar(
        height: 44.h,
        elevation: 1,
        backgroundColor: AppGrayscale.off,
        style: TabStyle.flip,
        items: [
          TabItem(
            icon: SvgPicture.asset('assets/images/home_icon0.svg'),
            activeIcon: SvgPicture.asset('assets/images/home_icon.svg'),
            title: 'Home',
          ),
          TabItem(
            icon: SvgPicture.asset('assets/images/discussion_icon0.svg'),
            activeIcon: SvgPicture.asset('assets/images/discussion_icon.svg'),
            title: 'Discussion',
          ),
          TabItem(
            icon: SvgPicture.asset('assets/images/profile_icon0.svg'),
            activeIcon: SvgPicture.asset('assets/images/profile_icon.svg'),
            title: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          _goBranch(selectedIndex);
        },
      ),
    );
  }
}
