import 'package:flutter/material.dart';
import 'package:kosan/models/city_model.dart';
import 'package:kosan/theme.dart';

class CityCard extends StatelessWidget {
  final CityModel city;
  CityCard({required this.city});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  fit: BoxFit.cover,
                ),
                city.isPopuler
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icon_star_active.png',
                              width: 16,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
