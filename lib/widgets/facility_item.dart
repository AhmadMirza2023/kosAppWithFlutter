import 'package:flutter/material.dart';
import 'package:kosan/theme.dart';

class FacilityItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int total;

  FacilityItem({
    required this.imageUrl,
    required this.name,
    required this.total,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '${total} ',
            style: purpleTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
            children: [
              TextSpan(
                text: name,
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: light,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
