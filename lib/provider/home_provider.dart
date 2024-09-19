import 'package:flutter/material.dart';
import '../model/product_model.dart';

class HomeProvider extends ChangeNotifier{

  List<ProductModel> productList = [
    ProductModel(
      productName: 'Earbuds',
      price: 99,
      rating: 4,
      count: 1,
      color: const Color(0xFFE3F2FD),
      image: 'assets/images/ear_buds.png',
      details: 'Wireless earbuds with noise cancellation and excellent sound quality.',
    ),
    ProductModel(
      productName: 'Purse',
      price: 129,
      rating: 4,
      count: 1,
      color: const Color(0xFFFCE4EC),
      image: 'assets/images/purse.png',
      details: 'Stylish purse with multiple compartments and a durable finish.',
    ),
    ProductModel(
      productName: 'Bag',
      price: 89,
      rating: 3,
      count: 1,
      color: const Color(0xFFE0F7FA),
      image: 'assets/images/bag.png',
      details: 'Versatile bag suitable for various occasions with ample storage space.',
    ),
    ProductModel(
      productName: 'Headphones',
      price: 149,
      rating: 5,
      count: 1,
      color: const Color(0xFFE8EAF6),
      image: 'assets/images/head_phone.png',
      details: 'Comfortable over-ear headphones with excellent sound isolation.',
    ),
    ProductModel(
      productName: 'Smartwatch',
      price: 199,
      rating: 4,
      count: 1,
      color: const Color(0xFFE8F5E9),
      image: 'assets/images/watch.png',
      details: 'Feature-packed smartwatch with fitness tracking and notifications.',
    ),
    ProductModel(
      productName: 'Bluetooth\nSpeaker',
      price: 89,
      rating: 4,
      count: 1,
      color: const Color(0xFFFFF3E0),
      image: 'assets/images/speaker.png',
      details: 'Portable Bluetooth speaker with crisp sound quality and long battery life.',
    ),
    ProductModel(
      productName: 'Laptop',
      price: 1199,
      rating: 5,
      count: 1,
      color: const Color(0xFFEDE7F6),
      image: 'assets/images/laptop.png',
      details: 'High-performance laptop with a sleek design and powerful hardware.',
    ),
    ProductModel(
      productName: 'Camera',
      price: 399,
      rating: 4,
      count: 1,
      color: const Color(0xFFE3F2FD),
      image: 'assets/images/camera.png',
      details: 'Digital camera with high resolution and various shooting modes.',
    ),

    ProductModel(
      productName: 'Smartphone',
      price: 799,
      rating: 5,
      count: 1,
      color: const Color(0xFFFFF9C4),
      image: 'assets/images/phone.png',
      details: 'Latest smartphone with high-resolution display and advanced features.',
    ),
    ProductModel(
      productName: 'Hair Dryer',
      price: 49,
      rating: 4,
      count: 1,
      color: const Color(0xFFF1F8E9),
      image: 'assets/images/dryer.png',
      details: 'Powerful hair dryer with multiple heat settings and a sleek design.',
    ),
  ];

  toggleDisplayView(ProductModel productModel,int index){
    productList[index]=productModel;
    notifyListeners();
  }


  Color darkenColor(Color color, [double amount = 0.1]) {
    assert(0 <= amount && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}