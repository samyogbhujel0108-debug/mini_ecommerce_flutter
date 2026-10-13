import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/product_card.dart';
import 'product_details_page.dart';

// SCREEN 2: Category page
// It receives the category name from the Home page.
class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Keep only the products of the selected category
    final categoryProducts = getProductsByCategory(categoryName);

    return Scaffold(
      appBar: AppBar(
        // Display the selected category name
        title: Text(categoryName == 'All' ? 'All Products' : categoryName),
      ),
      body: categoryProducts.isEmpty
          ? const Center(child: Text('No products found'))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: categoryProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final product = categoryProducts[index];
                return ProductCard(
                  product: product,
                  onViewDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
