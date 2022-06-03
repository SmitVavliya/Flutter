import 'package:ecommerce_app/size_config.dart';
import "package:flutter/material.dart";
import 'package:ecommerce_app/views/screens/widgets/BottomNavigationBar/bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  static String routeName = "/mainscreen";

  const MainScreen({Key? key}) : super(key: key);

  void onBottomIconPressed(int index) {
    print(index);
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // _appBar(),
                  // _title(),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      switchInCurve: Curves.easeInToLinear,
                      switchOutCurve: Curves.easeOutBack,
                      // child: isHomePageSelected
                      //     ? MyHomePage()
                      //     : Align(
                      //         alignment: Alignment.topCenter,
                      //         child: ShoppingCartPage(),
                      //       ),
                    ),
                  )
                ],
              ),
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
