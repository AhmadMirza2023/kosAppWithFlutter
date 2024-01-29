import 'package:flutter/material.dart';
import 'package:kosan/models/tips_model.dart';
import 'package:kosan/theme.dart';

class TipsCard extends StatelessWidget {
  final TipsModel tips;
  TipsCard({required this.tips});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          child: Image.asset(
            tips.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.name,
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            Text(
              'Updated ${tips.updatedAt}',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 70,
        ),
        Expanded(
          flex: 3,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
