import 'package:ecommerce_app/providers.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:ecommerce_app/views/screens/auth/signin_screen.dart';
import 'package:ecommerce_app/views/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        routes: routes,
        home: MainScreen(),
      ),
    );
  }
}
