import 'package:flutter/material.dart';
import 'package:kosan/models/bottomNavbarItem_model.dart';
import 'package:kosan/models/city_model.dart';
import 'package:kosan/models/space_model.dart';
import 'package:kosan/models/tips_model.dart';
import 'package:kosan/providers/space_provider.dart';
import 'package:kosan/theme.dart';
import 'package:kosan/widgets/bottom_navbar_item.dart';
import 'package:kosan/widgets/city_card.dart';
import 'package:kosan/widgets/space_card.dart';
import 'package:kosan/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Text(
                'Popular Cities',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: reguler,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: CityModel(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/image_jakarta.png',
                      isPopuler: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: CityModel(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/image_bandung.png',
                      isPopuler: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: CityModel(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/image_surabaya.png',
                      isPopuler: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: CityModel(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/image_palembang.png',
                      isPopuler: false,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: CityModel(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/image_aceh.png',
                      isPopuler: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: CityModel(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'assets/image_bogor.png',
                      isPopuler: false,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Text(
                'Recommended Space',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: reguler,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 24,
              ),
              child: FutureBuilder<List<SpaceModel>>(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text('Something Wrong!'),
                    );
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    print('No data available');
                    return Center(
                      child: Text('No Data Available!'),
                    );
                  } else {
                    List<SpaceModel> data = snapshot.data!;
                    int index = 0;
                    return Column(
                      children: data.map(
                        (item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                            child: SpaceCard(space: item),
                          );
                        },
                      ).toList(),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 30,
              ),
              child: Text(
                'Popular Cities',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: reguler,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 24,
              ),
              child: Column(
                children: [
                  TipsCard(
                    tips: TipsModel(
                      name: 'City Guidelines',
                      imageUrl: 'assets/image_cg.png',
                      updatedAt: '20 Apr',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    tips: TipsModel(
                      name: 'Jakarta Fairship',
                      imageUrl: 'assets/image_jf.png',
                      updatedAt: '11 Dec',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 145,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: const EdgeInsets.only(
          right: 24,
          left: 24,
          bottom: 30,
        ),
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: const Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              bottomNavbarItemModel: BottomNavbarItemModel(
                imageUrl: 'assets/icon_homee.png',
                isActive: true,
              ),
            ),
            BottomNavbarItem(
              bottomNavbarItemModel: BottomNavbarItemModel(
                imageUrl: 'assets/icon_mail.png',
                isActive: false,
              ),
            ),
            BottomNavbarItem(
              bottomNavbarItemModel: BottomNavbarItemModel(
                imageUrl: 'assets/icon_card.png',
                isActive: false,
              ),
            ),
            BottomNavbarItem(
              bottomNavbarItemModel: BottomNavbarItemModel(
                imageUrl: 'assets/icon_love.png',
                isActive: false,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
