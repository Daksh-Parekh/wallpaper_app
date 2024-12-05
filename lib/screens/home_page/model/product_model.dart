class ProductModel {
  int? id;
  String? title, description, category, image;
  double? price;
  RatingModel? ratingModel;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.category,
    this.image,
    this.description,
    this.ratingModel,
  });

  factory ProductModel.mapToModel(Map m2) {
    return ProductModel(
      id: m2['id'],
      title: m2['title'],
      price: m2['price'].toDouble(),
      description: m2['description'],
      category: m2['category'],
      image: m2['image'],
      ratingModel: RatingModel.mapToModel(m2['rating']),
    );
  }
}

class RatingModel {
  double? rate;
  int? count;

  RatingModel({
    this.count,
    this.rate,
  });

  factory RatingModel.mapToModel(Map m2) {
    return RatingModel(
      rate: m2['rate'].toDouble(),
      count: m2['count'],
    );
  }
}

// {
//         "id": 1,
//         "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
//         "price": 109.95,
//         "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
//         "category": "men's clothing",
//         "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
//         "rating": {
//             "rate": 3.9,
//             "count": 120
//         }
//     },