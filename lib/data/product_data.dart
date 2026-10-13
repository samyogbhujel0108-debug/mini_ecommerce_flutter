import 'package:flutter/material.dart';
import '../models/product.dart';

class ShopCategory {
  final String name;
  final IconData icon;
  const ShopCategory(this.name, this.icon);
}

const List<ShopCategory> categories = [
  ShopCategory('Electronics', Icons.devices),
  ShopCategory('Fashion', Icons.checkroom),
  ShopCategory('Shoes', Icons.hiking),
  ShopCategory('Beauty', Icons.spa),
  ShopCategory('Accessories', Icons.watch),
  ShopCategory('Home', Icons.chair),
];

// ---------- Images ----------
// Builds an Unsplash image URL from a photo id.
// To change an image, replace the id passed to _img() for that product.
String _img(String photoId) =>
    'https://images.unsplash.com/$photoId?w=500&h=500&fit=crop&q=80';

// ---------- Products (static / local data) ----------
final List<Product> products = [
  // Electronics
  Product(
    name: 'iPhone',
    category: 'Electronics',
    image: _img('photo-1511707171634-5f897ff02aa9'),
    price: 129000,
    rating: 4.8,
    description:
    'A powerful smartphone with a stunning display, fast processor and perfect camera.',
    isNew: true,
  ),
  Product(
    name: 'Laptop',
    category: 'Electronics',
    image: _img('photo-1517336714731-489689fd1ca8'),
    price: 89000,
    rating: 4.6,
    description: 'Lightweight laptop with 16GB RAM and a fast SSD.',
    discount: 10,
  ),
  Product(
    name: 'Headphones',
    category: 'Electronics',
    image: _img('photo-1505740420928-5e560c06d30e'),
    price: 3500,
    rating: 4.5,
    description:
    'Wireless headphones with high-quality sound and 30 hours of battery life.',
    discount: 20,
  ),
  Product(
    name: 'Smart Watch',
    category: 'Electronics',
    image: _img('photo-1523275335684-37898b6baf30'),
    price: 7500,
    rating: 4.3,
    description:
    'Track your steps, heart rate and notifications right from your wrist.',
    isNew: true,
  ),

  // Fashion
  Product(
    name: 'T-Shirt',
    category: 'Fashion',
    image: _img('photo-1521572163474-6864f9cf17ab'),
    price: 999,
    rating: 4.2,
    description: 'Soft 100% cotton t-shirt.',
    discount: 15,
  ),
  Product(
    name: 'Denim Jacket',
    category: 'Fashion',
    image: _img('photo-1551028719-00167b16eac5'),
    price: 3200,
    rating: 4.4,
    description: 'Classic denim jacket that goes well with almost any outfit.',
  ),

  // Shoes
  Product(
    name: 'Sneakers',
    category: 'Shoes',
    image: _img('photo-1491553895911-0055eca6402d'),
    price: 4800,
    rating: 4.7,
    description:
    'Lightweight sneakers with a cushioned sole for all-day comfort.',
    isNew: true,
  ),
  Product(
    name: 'Running Shoes',
    category: 'Shoes',
    image: _img('photo-1542291026-7eec264c27ff'),
    price: 5600,
    rating: 4.5,
    description: 'Breathable running shoes with great grip.',
    discount: 25,
  ),

  // Beauty
  Product(
    name: 'Face Cream',
    category: 'Beauty',
    image: _img('photo-1556228578-0d85b1a4d571'),
    price: 1200,
    rating: 4.1,
    description: 'Moisturizing face cream for soft and healthy-looking skin.',
  ),
  Product(
    name: 'Perfume',
    category: 'Beauty',
    image: _img('photo-1541643600914-78b084683601'),
    price: 2800,
    rating: 4.6,
    description: 'A fresh and long-lasting fragrance for every occasion.',
    discount: 10,
  ),

  // Accessories
  Product(
    name: 'Backpack',
    category: 'Accessories',
    image: _img('photo-1553062407-98eeb64c6a62'),
    price: 2500,
    rating: 4.4,
    description:
    'Spacious and water-resistant backpack with a padded laptop pocket.',
  ),
  Product(
    name: 'Sunglasses',
    category: 'Accessories',
    image: _img('photo-1572635196237-14b3f281503f'),
    price: 1500,
    rating: 4.0,
    description: 'Stylish sunglasses with UV protection.',
    isNew: true,
  ),

  // Home
  Product(
    name: 'Table Lamp',
    category: 'Home',
    image: _img('photo-1507473885765-e6ed057f782c'),
    price: 1800,
    rating: 4.3,
    description: 'Modern table lamp that gives a warm light to your room.',
  ),
  Product(
    name: 'Cushion Set',
    category: 'Home',
    image: _img('photo-1584100936595-c0654b55a2e6'),
    price: 1400,
    rating: 4.2,
    description: 'Set of soft cushions to make your sofa cozy.',
    discount: 30,
  ),
];

// Returns only the products that belong to a category.
// "All" returns every product.
List<Product> getProductsByCategory(String categoryName) {
  if (categoryName == 'All') return products;
  return products.where((p) => p.category == categoryName).toList();
}