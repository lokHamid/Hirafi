import 'package:flutter/material.dart';

class Tool{
  String title;
  String category;
  String description;
  String? brand;
  String seller_uid;
  String price;

  Tool(
      {required this.title,required this.category,required this.seller_uid,required this.price,required this.brand,required this.description}
      );

  factory Tool.fromMap(Map<String,dynamic> map){
    return Tool(
      title: map['title'],
      category: map['category'],
      description: map['description'],
      brand: map['brand'],
      seller_uid: map['seller'],
      price: map['price']
    );
  }

}