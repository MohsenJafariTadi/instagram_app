import 'package:flutter/material.dart';

import 'package:instagram/screens/main_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            headlineMedium: TextStyle(
          fontFamily: 'GB',
          fontSize: 16,
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('images/pattern1.png'),
        ),
      ),
      child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: Center(
                  child: Image(
                    image: AssetImage('images/logo_splash.png'),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: Column(
                  children: [
                    Text(
                      'from',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Mohsen Jafari',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
