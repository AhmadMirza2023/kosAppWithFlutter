import 'package:flutter/material.dart';
import 'package:kosan/models/space_model.dart';
import 'package:kosan/screens/error_screen.dart';
import 'package:kosan/theme.dart';
import 'package:kosan/widgets/facility_item.dart';
import 'package:kosan/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final SpaceModel spaces;

  DetailScreen({required this.spaces});
  @override
  Widget build(BuildContext context) {
    void _launchUrl(Uri url) async {
      try {
        if (await canLaunchUrl(url)) {
          launchUrl(url);
        } else {
          print("Tidak dapat menemukan url : $url");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorScreen(),
            ),
          );
        }
      } catch (e) {
        print("Error launching URL: $e");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorScreen(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Image.network(
            spaces.imageUrl,
            height: 400,
            fit: BoxFit.cover,
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              children: [
                const SizedBox(
                  height: 290,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  spaces.name,
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 22,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${spaces.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontWeight: light,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24, top: 30),
                            child: Row(
                              children: [1, 2, 3, 4, 5].map(
                                (index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: RatingItem(
                                      index: index,
                                      rating: spaces.rating,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Main Facilities',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: reguler,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FacilityItem(
                                  imageUrl: 'assets/image_kitchen.png',
                                  name: 'kitchen',
                                  total: spaces.numberOfKitchens,
                                ),
                                FacilityItem(
                                  imageUrl: 'assets/image_bedroom.png',
                                  name: 'bedroom',
                                  total: spaces.numberOfBedrooms,
                                ),
                                FacilityItem(
                                  imageUrl: 'assets/image_cupboard.png',
                                  name: 'Big Lemari',
                                  total: spaces.numberOfCupboards,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text(
                              'Photos',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: reguler,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 88,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: spaces.photos.map(
                                (item) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 24),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        item,
                                        width: 100,
                                        height: 88,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                          print(
                                              'Error loading image : $error\nStack Trace : $stackTrace');
                                          return Image.asset(
                                            'assets/image_errorPhotos.png',
                                            width: 100,
                                            height: 88,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: reguler,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '${spaces.address}\n${spaces.city}',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: reguler,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: IconButton(
                                onPressed: () {
                                  _launchUrl(Uri.parse(spaces.mapUrl));
                                },
                                icon: Image.asset(
                                  'assets/icon_map.png',
                                  width: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: purpleColor,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 140,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              )),
                          onPressed: () {
                            launchUrl(Uri.parse('tel:+${spaces.phone}'));
                          },
                          child: Text(
                            'Boook Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/icon_back.png',
                    width: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icon_wishlist.png',
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
