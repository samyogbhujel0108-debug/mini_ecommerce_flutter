import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_image.dart';

// Reusable Product Card. We write it ONCE and reuse it for every product
// (on the home page and on the category page).
//
// It is a StatefulWidget because the favorite (heart) icon can change.
class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onViewDetails; // what happens when the button is pressed

  const ProductCard({
    super.key,
    required this.product,
    required this.onViewDetails,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Card(
      clipBehavior: Clip.antiAlias, // keeps the image inside the rounded corners
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: widget.onViewDetails,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- Image area -----
            // Expanded makes the image take all the free height,
            // so the card never overflows.
            Expanded(
              // Stack lets us put badges and the heart ON TOP of the image
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ProductImage(url: product.image),

                  // Badges (top-left)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (product.discount > 0)
                          _Badge(text: '-${product.discount}%', color: Colors.red),
                        if (product.isNew) ...[
                          const SizedBox(height: 4),
                          const _Badge(text: 'NEW', color: Colors.green),
                        ],
                      ],
                    ),
                  ),

                  // Favorite icon (top-right)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      iconSize: 18,
                      visualDensity: VisualDensity.compact,
                      style: IconButton.styleFrom(backgroundColor: Colors.white70),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ----- Text + button area -----
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Rs. ${product.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: widget.onViewDetails,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('View Details', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Small private widget for the "-20%" and "NEW" labels.
// It uses a Container for the background, padding and rounded corners.
class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
