import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'mydb.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  static late Database db;

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDatabaseBefore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSplashScreen(
        backgroundColor: Colors.transparent,
        splash: Image.asset(
          'images/lshop.png',
          height: 200,
          width: 200,
        ),
        nextScreen: BottomNav(0),
        splashTransition: SplashTransition.rotationTransition,
        splashIconSize: 230,
        animationDuration: const Duration(seconds: 2),
        curve: Curves.bounceIn,
      ),
    );
  }

  Future<void> getDatabaseBefore() async {
    await Db().getDataBase().then((value) {
      setState(() {
        SplashScreen.db = value;
      });
    });
  }
}
