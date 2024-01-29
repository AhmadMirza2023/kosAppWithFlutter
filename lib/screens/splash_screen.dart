import 'package:flutter/material.dart';
import 'package:kosan/screens/home_screen.dart';
import 'package:kosan/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/image_splash.png')),
          SafeArea(
            bottom: false,
            child: Container(
              padding: EdgeInsets.only(
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/image_logo.png',
                    width: 50,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Find Cozy House\nto Stay and Happy',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 50,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Explore Now',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
