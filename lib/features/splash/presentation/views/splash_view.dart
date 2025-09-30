import 'package:flutter/material.dart';
import 'package:notes_app/features/Show%20Notes/presentation/views/notes_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bookAnimation;
  late Animation<Offset> textAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    bookAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 1, curve: Curves.bounceInOut),
      ),
    );

    textAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 1, curve: Curves.bounceInOut),
      ),
    );
    controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      // Use pushReplacement to replace the current screen with the next one.
      // This prevents the user from going back to the splash screen.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NotesView()),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: bookAnimation,
              child: Icon(Icons.assignment, size: 150, color: Colors.white),
            ),

            SlideTransition(
              position: textAnimation,
              child: const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
