import 'package:admin_russia/screen/detail_screen.dart';
import 'package:admin_russia/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) =>
          const HomeScreen(),

        },
        onGenerateRoute: generateRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => const Text('Unknown route'),
        ),

      ),
  );

  }
Route<dynamic>? generateRoute(RouteSettings settings) {
  if (settings.name == DetailScreen.routeName) {
    return MaterialPageRoute(
        builder: (_) {
          return const DetailScreen();
        },
        settings: settings);
  }
  return null;
}




