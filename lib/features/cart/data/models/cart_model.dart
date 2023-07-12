// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  bool? status;
  Data? data;
  CartModel(
    this.status,
    this.data,
  );
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'cart_items')
  List<Cart>? cartItems;

  @JsonKey(name: 'sub_total')
  int? subTotal;
  int? total;
  Data(
    this.cartItems,
    this.subTotal,
    this.total,
  );
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Cart {
  Product? product;
  Cart({
    this.product,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@JsonSerializable()
class Product {
  int? id;
  dynamic price;
  @JsonKey(name: 'old_price')
  dynamic oldPrice;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic description;
  @JsonKey(name: 'in_favorites')
  bool? inFavorite;
  @JsonKey(name: 'in_cart')
  bool? inCart;
  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.inFavorite,
    this.inCart,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

// {
//     "status": true,
//     "message": null,
//     "data": {
//         "cart_items": [],
//         "sub_total": 0,
//         "total": 0
//     }
// }
//{
//     "status": true,
//     "message": null,
//     "data": {
//         "cart_items": [
//             {
//                 "id": 35983,
//                 "quantity": 1,
//                 "product": {
//                     "id": 53,
//                     "price": 5599,
//                     "old_price": 10230,
//                     "discount": 45,
//                     "image": "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg",
//                     "name": "مكبر صوت بلوتوث مقاوم للمياه ومحمول اكستريم 2 من جيه بي ال JBLXTREME2BLUAM - ازرق",
//                     "description": "مدة تشغيل الموسيقى: 15 ساعة\r\nالطاقة المخرجة (وات): 2 × 20\r\nالأبعاد: 13.6 × 28.8 × 13.2 سنتيمتر\r\nالوزن: 2.39 كيلوجرام\r\nاصدار البلوتوث: 4.2\r\nسعة البطارية: 10000 مللي امبير في الساعة\r\nمدة الشحن: 3 ساعات ونصف\r\nمدخل كابل صوت 3.5 ملم: متاح\r\nخاصية إيقاف التشغيل التلقائي: متاحة\r\nتقنية البلوتوث: متاحة\r\nيدعم تطبيق جيه بي ال كونيكت+: نعم \r\nشاحن باور بانك: متاح\r\nمكبر صوت خارجي: متاح\r\nخاصية المساعد الصوتي: متاحة\r\nمقاوم للمياه: نعم",
//                     "images": [
//                         "https://student.valuxapps.com/storage/uploads/products/1615440689Oojt6.item_XXL_36330138_142814947.jpeg",
//                         "https://student.valuxapps.com/storage/uploads/products/16154406895ynKU.item_XXL_36330138_142814944.jpeg",
//                         "https://student.valuxapps.com/storage/uploads/products/1615440689MjvIY.item_XXL_36330138_142814940.jpeg",
//                         "https://student.valuxapps.com/storage/uploads/products/1615440689QITsu.item_XXL_36330138_142814934.jpeg"
//                     ],
//                     "in_favorites": false,
//                     "in_cart": true
//                 }
//             }
//         ],
//         "sub_total": 5599,
//         "total": 5599
//     }
// }