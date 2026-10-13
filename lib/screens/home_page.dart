import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import 'category_page.dart';
import 'product_details_page.dart';

// SCREEN 1: Home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Helper: go to the category page and PASS the category name
  void _openCategory(BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(categoryName: categoryName),
      ),
    );
  }

  // Helper: go to the details page and PASS the selected product
  void _openProduct(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show only the first 6 products as "Popular Products"
    final popularProducts = products.take(6).toList();

    return Scaffold(
      // ----- AppBar: logo/name + search + cart -----
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.shopping_bag),
            SizedBox(width: 8),
            Text('MyShop', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search coming soon')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Your cart is empty')),
              );
            },
          ),
        ],
      ),

      // The whole page scrolls vertically
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // ----- Carousel -----
            BannerCarousel(
              onBannerTap: (categoryName) => _openCategory(context, categoryName),
            ),

            const SizedBox(height: 16),

            // ----- Categories (horizontal scrolling) -----
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'What are you shopping for today?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CategoryItem(
                      name: category.name,
                      icon: category.icon,
                      onTap: () => _openCategory(context, category.name),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // ----- Popular Products header + See All -----
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => _openCategory(context, 'All'),
                    child: const Text('See All →'),
                  ),
                ],
              ),
            ),

            // ----- Product cards -----
            // shrinkWrap + NeverScrollableScrollPhysics: the grid takes only
            // the height it needs and lets the outer SingleChildScrollView scroll.
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: popularProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final product = popularProducts[index];
                return ProductCard(
                  product: product,
                  onViewDetails: () => _openProduct(context, product),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
