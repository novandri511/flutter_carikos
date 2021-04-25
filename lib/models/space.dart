class Space {
  int id;
  String name;
  String imageUrl;
  int harga;
  String kota;
  String negara;
  int rating;
  String address;
  String phone;
  String map_url;
  List photos;
  int number_of_kitchens;
  int number_of_bedrooms;
  int number_of_cupboards;

  Space(
      {this.id,
      this.name,
      this.imageUrl,
      this.harga,
      this.kota,
      this.negara,
      this.rating,
      this.address,
      this.map_url,
      this.phone,
      this.photos,
      this.number_of_bedrooms,
      this.number_of_cupboards,
      this.number_of_kitchens});

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    kota = json['city'];
    negara = json['country'];
    imageUrl = json['image_url'];
    harga = json['price'];
    rating = json['rating'];
    address = json['address'];
    map_url = json['map_url'];
    phone = json['phone'];
    photos = json['photos'];
    number_of_kitchens = json['number_of_kitchens'];
    number_of_cupboards = json['number_of_cupboards'];
    number_of_bedrooms = json['number_of_bedrooms'];
  }
}
