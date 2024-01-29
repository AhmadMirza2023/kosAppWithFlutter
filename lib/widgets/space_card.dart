import 'package:flutter/material.dart';
import 'package:kosan/models/space_model.dart';
import 'package:kosan/screens/detail_screen.dart';
import 'package:kosan/theme.dart';

class SpaceCard extends StatelessWidget {
  final SpaceModel space;
  SpaceCard({required this.space});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              spaces: SpaceModel(
                id: space.id,
                rating: space.rating,
                imageUrl: space.imageUrl,
                name: space.name,
                price: space.price,
                city: space.city,
                country: space.country,
                address: space.address,
                mapUrl: space.mapUrl,
                numberOfBedrooms: space.numberOfBedrooms,
                numberOfCupboards: space.numberOfCupboards,
                numberOfKitchens: space.numberOfKitchens,
                phone: space.phone,
                photos: space.photos,
              ),
            ),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star_active.png',
                            width: 16,
                          ),
                          Text(
                            ' ${space.rating}/5',
                            style: whiteTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '${space.city}, ${space.country}',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: light,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
