import 'dart:core';

class Product{
  int? id;
 String? brand;
  String? name;
  String? product_link;
  String? price;
  String? image_link;
  String? description;
  String? category;
  String? product_type;


  Product.fromJson(Map<String,dynamic>json){
    id=json['id'];
    brand=json['brand'];
    name=json['name'];
    product_link=json['product_link'];
    price=json['price'];
    image_link=json['image_link'];
    description=json['description'];
    category=json['category'];
    product_type=json['product_type'];

  }
}



