import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:healthy_life/featured_workout.dart';
import 'package:healthy_life/routes.dart';
import 'package:healthy_life/screens/home/components/about/about.dart';
import 'package:healthy_life/screens/home/components/notifications.dart';

import 'package:healthy_life/screens/home/home_screen.dart';
import 'package:healthy_life/workout_levels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
          splash: Column(
            children: [
              Image.asset('assets/images/home.png',height: 500,),
              
            ],
          ),
          nextScreen: const HomeScreen(),
          splashIconSize: 500,),
      routes: {
        // "/": (context) => const HomeScreen(),
        MyRoutes.homeRoute: (context) => const HomeScreen(),
        MyRoutes.workoutLevelsRoute: (context) => const WorkoutLevelsPage(),
        MyRoutes.featuredWorkoutRoute: (context) => const FeaturedWorkoutPage(),
        MyRoutes.notificationsRoute: (context) => const NotificationsPage(),
        MyRoutes.aboutRoute: (context) => const AboutPage(),
      },
    );
  }
}
