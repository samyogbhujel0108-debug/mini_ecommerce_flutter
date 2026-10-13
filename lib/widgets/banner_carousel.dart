import 'package:carousel_slider/carousel_slider.dart'; // package from pub.dev
import 'package:flutter/material.dart';
import 'product_image.dart';

// Data for one banner. Each banner has an image, a text and a "link":
// the category page that opens when the banner is tapped.
class BannerData {
  final String image;
  final String title;
  final String subtitle;
  final String categoryName;

  const BannerData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.categoryName,
  });
}

const List<BannerData> banners = [
  BannerData(
    image: 'https://picsum.photos/seed/summersale/900/400',
    title: 'Summer Sale',
    subtitle: 'Up to 30% off on Fashion',
    categoryName: 'Fashion',
  ),
  BannerData(
    image: 'https://picsum.photos/seed/newarrivals/900/400',
    title: 'New Arrivals',
    subtitle: 'Fresh styles for your feet',
    categoryName: 'Shoes',
  ),
  BannerData(
    image: 'https://picsum.photos/seed/electronicsdeal/900/400',
    title: 'Electronics Discount',
    subtitle: 'Best deals on gadgets',
    categoryName: 'Electronics',
  ),
];

// Carousel (sliding banners) built with the carousel_slider package.
class BannerCarousel extends StatefulWidget {
  // Called when a banner is tapped; the HomePage decides where to navigate.
  final void Function(String categoryName) onBannerTap;

  const BannerCarousel({super.key, required this.onBannerTap});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0; // used for the dots below the banner

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 170,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enlargeCenterPage: true,
            viewportFraction: 0.92,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: banners.map((banner) {
            return GestureDetector(
              onTap: () => widget.onBannerTap(banner.categoryName),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ProductImage(url: banner.image),
                    // dark gradient so the white text is readable
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withOpacity(0.65),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            banner.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banner.subtitle,
                            style: const TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Shop now →',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        // Dots showing which banner is active
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (index) {
            final isActive = index == _currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
