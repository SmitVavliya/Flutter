import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/views/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/views/screens/feeds/feeds_screen.dart';
import 'package:ecommerce_app/views/screens/home/home_screen.dart';
import 'package:ecommerce_app/views/screens/profile/profile.screen.dart';
import 'package:ecommerce_app/views/screens/search/search_screen.dart';
import 'package:ecommerce_app/views/screens/upload/upload_screen.dart';
import 'package:ecommerce_app/views/screens/home/widgets/icon_btn_with_counter.dart';
import "package:flutter/material.dart";
import 'package:ecommerce_app/views/screens/widgets/BottomNavigationBar/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/mainscreen";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const FeedsScreen(),
    const SearchScreen(),
    CartScreen(),
    const UploadScreen(),
    const ProfileScreen(),
  ];

  void onBottomIconPressed(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: getHeight(context) - 50,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xfffbfbfb), Color(0xfff7f7f7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: screens[_index],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(
              onIconPresedCallback: onBottomIconPressed,
            ),
          ),
        ],
      ),
    );
  }
}
