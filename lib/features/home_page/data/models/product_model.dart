//  {
//         "id": 2,
//         "title": "Mens Casual Premium Slim Fit T-Shirts ",
//         "price": 22.3,
//         "description": "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
//         "category": "men's clothing",
//         "image": "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
//         "rating": {
//             "rate": 4.1,
//             "count": 259
//         }
//     },
class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});
  ProductModel.fromJson(json) {
    id = json["id"];
    title = json["title"];
    price = json["price"] is int ? (json["price"] as int).toDouble():json["price"];
    description = json["description"];
    category = json["category"];
    image = json["image"];
   rating = Rating.fromJason(json);
  }
}

class Rating {
  double? rate;
  int? count;
  Rating({this.rate, this.count});
  Rating.fromJason(json) {
    rate = json["rate"];
    count = json["count"];
  }
}
