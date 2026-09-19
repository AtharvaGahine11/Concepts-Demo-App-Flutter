import 'package:flutter/material.dart';

/// ImageGridScreen demonstrates displaying local asset images using Image.asset()
/// inside a GridView.count layout, while applying the custom font configured in pubspec.yaml.
class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  // Local image list with titles
  final List<Map<String, String>> imageData = const [
    {'path': 'assets/images/image1.jpg', 'title': 'Nature'},
    {'path': 'assets/images/image2.jpg', 'title': 'Mountain'},
    {'path': 'assets/images/image3.jpg', 'title': 'Travel'},
    {'path': 'assets/images/image4.jpg', 'title': 'City'},
    {'path': 'assets/images/image5.jpg', 'title': 'Ocean'},
    {'path': 'assets/images/image6.jpg', 'title': 'Sunset'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images, Assets & Fonts'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Banner explaining custom font usage
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondaryContainer,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.font_download_rounded,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Custom Font "DemoFont" active on titles below!',
                    style: TextStyle(
                      fontFamily: 'DemoFont',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // GridView displaying local asset images
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: imageData.map((item) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Image.asset() loading local images
                        Image.asset(
                          item['path']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade300,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.broken_image, size: 40, color: Colors.grey),
                                  SizedBox(height: 4),
                                  Text('Image missing'),
                                ],
                              ),
                            );
                          },
                        ),
                        // Dark gradient overlay for text readability
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black87,
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item['title']!,
                              style: const TextStyle(
                                fontFamily: 'DemoFont',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
