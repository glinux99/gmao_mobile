import 'package:flutter/material.dart';
import 'package:virunga_energies/Screens/login/login_screen.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late String image;
  @override
  void initState() {
    super.initState();
    // image = 'assets/images/cero_Uzisha_Light.png';
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  prefs?.getBool('globalData')==true? const LoginPage(): const LoginPage ()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ve.png',
                cacheWidth: 500,
                cacheHeight: 500,
                height: MediaQuery.sizeOf(context).width - 10,
                width: MediaQuery.sizeOf(context).width - 10,
                fit: BoxFit.contain,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
