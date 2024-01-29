class SpaceModel {
  int id;
  int rating;
  String imageUrl;
  String name;
  int price;
  String city;
  String country;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboards;

  SpaceModel({
    required this.id,
    required this.rating,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.city,
    required this.country,
    required this.address,
    required this.mapUrl,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
    required this.numberOfKitchens,
    required this.phone,
    required this.photos,
  });

  SpaceModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        city = json['city'] ?? '',
        country = json['country'] ?? '',
        price = json['price'] ?? 0,
        imageUrl = json['image_url'] ?? '',
        rating = json['rating'] ?? 0,
        address = json['address'] ?? '',
        phone = json['phone'] ?? '',
        mapUrl = json['map_url'] ?? '',
        photos = json['photos'] != null ? List.from(json['photos']) : [],
        numberOfKitchens = json['number_of_kitchens'] ?? 0,
        numberOfBedrooms = json['number_of_bedrooms'] ?? 0,
        numberOfCupboards = json['number_of_cupboards'] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'country': country,
      'price': price,
      'image_url': imageUrl,
      'rating': rating,
      'address': address,
      'phone': phone,
      'map_url': mapUrl,
      'photos': photos,
      'number_of_kitchens': numberOfKitchens,
      'number_of_bedrooms': numberOfBedrooms,
      'number_of_cupboards': numberOfCupboards,
    };
  }
}
