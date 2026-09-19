import 'package:flutter/material.dart';

/// AnimationScreen demonstrates implicit animations using AnimatedContainer.
/// Clicking the toggle button updates state via setState(), triggering smooth
/// transitions for width, height, color, border radius, and alignment.
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // State variable controlling animation toggle
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Explanatory hint banner
            Card(
              elevation: 2,
              color: Colors.blue.shade50,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Press the button to see AnimatedContainer smoothly change its properties.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // AnimatedContainer Stage Area
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.all(16.0),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  alignment: isAnimated ? Alignment.centerRight : Alignment.centerLeft,
                  child: AnimatedContainer(
                    // Duration and Curve controlling the interpolation speed & style
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    
                    // Animated Properties
                    width: isAnimated ? 280 : 150,
                    height: isAnimated ? 200 : 150,
                    decoration: BoxDecoration(
                      color: isAnimated ? Colors.deepOrangeAccent : Colors.indigo,
                      borderRadius: BorderRadius.circular(isAnimated ? 100 : 20),
                      boxShadow: [
                        BoxShadow(
                          color: (isAnimated ? Colors.deepOrange : Colors.indigo)
                              .withAlpha(100),
                          blurRadius: isAnimated ? 20 : 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isAnimated ? Icons.stars_rounded : Icons.square_rounded,
                            size: isAnimated ? 50 : 40,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            isAnimated ? 'Expanded State' : 'Initial State',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Toggle Button triggering setState()
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isAnimated = !isAnimated;
                  });
                },
                icon: Icon(
                  isAnimated ? Icons.replay_rounded : Icons.play_arrow_rounded,
                ),
                label: Text(
                  isAnimated ? 'Reset Animation' : 'Animate',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
