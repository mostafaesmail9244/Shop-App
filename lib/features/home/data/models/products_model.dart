
// import 'package:equatable/equatable.dart';

// class ProductsModel extends Equatable {
//   final int id;
//   final dynamic price;
//   final dynamic oldPrice;
//   final dynamic discount;
//   final String name;
//   final String image;
//   // final bool inFavorits;
//   // final bool inCart;
//   const ProductsModel({
//     required this.id,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.name,
//     required this.image,
//     // required this.inFavorits,
//     // required this.inCart,
//   });
//   factory ProductsModel.fromJson(Map<String, dynamic> json) {
//     return ProductsModel(
//       id: json['id'],
//       price: json['price'],
//       oldPrice: json['old_price'],
//       discount: json['discount'],
//       name: json['image'],
//       image: json['name'],
//       // inFavorits: json['in_favorites'].to,
//       // inCart: json['in_cart'],
//     );
//   }

//   @override
//   List<Object> get props {
//     return [
//       id,
//       price,
//       oldPrice,
//       discount,
//       name,
//       image,
//       // inFavorits,
//       // inCart,
//     ];
//   }
// }
