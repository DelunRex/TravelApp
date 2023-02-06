import 'package:flutter/material.dart';
import 'package:travelapp/presentation/Landing/landing_screen.dart';
import 'package:travelapp/presentation/PlaceDetails/place_details_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LandingScreen.id:
        return MaterialPageRoute<Widget>(
          builder: (BuildContext context) => const LandingScreen(),
        );
      case PlaceDetailsScreen.id:
        return MaterialPageRoute<Widget>(
          builder: (BuildContext context) => PlaceDetailsScreen(),
        );
      default:
        return MaterialPageRoute<Widget>(
          builder: (_) => const Center(
            child: Text('Unimplemented Route'),
          ),
        );
    }
  }
}
