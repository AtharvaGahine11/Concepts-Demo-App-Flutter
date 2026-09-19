import 'package:flutter/material.dart';

/// HomeScreen serves as the main hub of the application.
/// It displays a welcome banner and three main feature cards that navigate
/// to specific screens using named routes via Navigator.pushNamed().
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Concepts Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome / Description Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.school_rounded,
                      size: 48,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Welcome to Flutter Concepts Demo!',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Explore basic Flutter concepts including Form validation, local asset images, custom typography, and explicit implicit animations.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Select a Module to Explore',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            // Card 1: User Input & Forms
            _buildNavCard(
              context: context,
              title: 'User Input & Forms',
              subtitle: 'Form validation and user input',
              icon: Icons.assignment_ind_rounded,
              color: Colors.blue.shade100,
              iconColor: Colors.blue.shade800,
              routeName: '/form',
            ),

            const SizedBox(height: 12),

            // Card 2: Images, Assets & Fonts
            _buildNavCard(
              context: context,
              title: 'Images, Assets & Fonts',
              subtitle: 'Local images and custom fonts',
              icon: Icons.photo_library_rounded,
              color: Colors.teal.shade100,
              iconColor: Colors.teal.shade800,
              routeName: '/images',
            ),

            const SizedBox(height: 12),

            // Card 3: Animations
            _buildNavCard(
              context: context,
              title: 'Animations',
              subtitle: 'AnimatedContainer demonstration',
              icon: Icons.auto_awesome_rounded,
              color: Colors.orange.shade100,
              iconColor: Colors.orange.shade800,
              routeName: '/animation',
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to create attractive, consistent navigation cards.
  Widget _buildNavCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Color iconColor,
    required String routeName,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Mandatory Requirement: Use Navigator.pushNamed(context, routeName)
          Navigator.pushNamed(context, routeName);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color,
                child: Icon(icon, color: iconColor, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey.shade700,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
