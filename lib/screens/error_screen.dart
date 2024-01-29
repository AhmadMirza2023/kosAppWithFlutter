import 'package:flutter/material.dart';
import 'package:kosan/theme.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image_error.png',
              width: 300,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'Where are you going?',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Text(
                'Seems like the page that you were requested is already gone',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: purpleColor,
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 42,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Back to Home',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
