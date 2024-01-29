import 'package:flutter/material.dart';
import 'package:kosan/models/bottomNavbarItem_model.dart';
import 'package:kosan/theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final BottomNavbarItemModel bottomNavbarItemModel;
  BottomNavbarItem({required this.bottomNavbarItemModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            bottomNavbarItemModel.imageUrl,
            width: 26,
            color: bottomNavbarItemModel.isActive ? purpleColor : greyColor,
          ),
        ),
        bottomNavbarItemModel.isActive == true
            ? Container(
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.circular(1000),
                ),
              )
            : Container(),
      ],
    );
  }
}
